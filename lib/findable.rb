module Findable

  module ClassMethods
    def find_by_name # => Class Method
      puts "I'm a module method"
    end
  end

  module InstanceMethods
    def sing # => Instance method
      puts "I'mmm singing"
    end
  end
end
