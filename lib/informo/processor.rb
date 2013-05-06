module Informo
  class PROCESSOR
    def count
      total = 0
      File.open("/proc/cpuinfo").each_line do |line|
        total += 1 if line =~ /^processor/ 
      end

      return total
    end

    def details
      count = -1
      processors = Array.new

      File.open("/proc/cpuinfo").each_line do |line|
        
        if line =~ /(processor|vendor_id|model name|cpu MHz|cache size)\s+:\s+(.+)/
          key, value = $1, $2
          if key =~ /processor/
            count += 1
            processors[count] = Hash.new
          else
            key = key.gsub(/\s+/,"_")
            processors[count][key] = value
          end
        end
      end 

      return processors
    end
  end
end
