module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, *args)
      @validations ||= []
      @validations << {name: name, type: type, arguments: args.first} # first?
    end 
  end

  module InstanceMethods
    
    def validate!
      self.class.validations.each do |validation|
        send("#{validation[:type]}", instance_variable_get("@#{validation[:name]}"), *validation[:arguments] )
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def presence(name)
      raise 'Аттрибут nil или empty' if name.nil? || name.empty?
    end

    def type(name, type)
     raise "Требуется тип аргумента: #{type}" unless name.class == type
    end

    def format(name, format)
      raise 'Не тот формат' if name !~ format
    end
  end
end

  #class Car
#   include Validation
#   NUMBER_FORMAT = /^([a-zа-я0-9]{3})([-— − –])?([a-zа-я0-9]{2})$/i.freeze
  
#   validate :name, :type, String
#   validate :name, :presence
#   validate :name, :format, NUMBER_FORMAT

#   def initialize(name)
#     @name = name
#     validate!
#   end
  # end
