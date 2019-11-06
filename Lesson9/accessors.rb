module Acсessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        variable_name = "@#{name}"
        history_variable = "@#{name}_history"
        define_method(name) { instance_variable_get(variable_name) }
        define_method("#{name}=") do  |value|
          history_value = instance_variable_get(history_variable) || []
          previous_value  = instance_variable_get(variable_name)
          instance_variable_set(history_variable, history_value << previous_value) unless previous_value.nil?
          instance_variable_set(variable_name,value)
        end  
        define_method("#{name}_history") { instance_variable_get(history_variable) }
      end
    end

    def strong_attr_accessor(name, type)
      variable_name = "@#{name}"
      define_method(name) {instance_variable_get(variable_name) }
      define_method("#{name}=") do |value| 
        raise "Тип: #{value} должен быть: #{type}" unless value.class == type
        instance_variable_set(variable_name, value)
      end
    end
  end
end

# class Car
#   include Acсessor

#   attr_accessor_with_history :a, :b, :c
#   strong_attr_accessor :d, Integer
# end

# car = Car.new
