module Informo
  class MEMORY
    def max_module_size
      `dmidecode -t 5`.each_line do |line|
        if line =~ /Maximum Memory Module Size.+?(\d+)\s+/
          max_module_size = $1
          return max_module_size
        end
      end
    end

    def max_modules
      `dmidecode -t 5`.each_line do |line|
        if line =~ /Associated Memory Slots.+?(\d+)\s+/
          max_modules = $1
          return max_modules
        end
      end
    end

    def max_capacity
      `dmidecode -t 5`.each_line do |line|
        if line =~ /Maximum Total Memory Size.+?(\d+)\s+/
          max_capacity = $1
          return max_capacity
        end
      end
    end

    def installed
      `free -m`.each_line do |line|
        if line =~ /^Mem.+?(\d+)\s+/
          installed_memory = $1
          return installed_memory
        end
      end
    end

    def slots
      count = -1
      modules = Array.new

      `dmidecode -t 17`.each_line do |line|
        if line =~ /\cI(Array Handle|Size|Locator|Speed|Form Factor):\s*(.*)$/
          key, value = $1, $2
          if key =~ /Array Handle/
            count += 1
            modules[count] = Hash.new
          else
            key = "type" if key =~ /Form Factor/
            modules[count][key.downcase] = value
          end
        end
      end

      return modules
    end

  end
end
