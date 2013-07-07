module Informo
  class NETWORK
    def interfaces
      interfaces = Array.new
      if File.exists?("/sbin/ip")
        `ip a`.each_line do |line|
          interfaces.push($1) if line =~ /scope.+?\s(\w+\d+(:.+?)?)$/  
        end
      else
        `ifconfig -a`.each_line do |line|
          interfaces.push($1) if line =~ /^(\w+\d+(:.+?)?)\s+Link/
        end
      end

      return interfaces
    end

    def interface_details(dev)
      details = Hash.new
      details["ip6"] = Array.new
      count = -1 

      if File.exists?("/sbin/ip") 
        `ip addr show #{dev}`.each_line do |line|
          details["mtu"] = $1 if line =~ /mtu (\d+)/

          if line =~ /inet\s(\d+\.\d+\.\d+\.\d+)\/(\d+)\s+brd\s(\d+\.\d+\.\d+\.\d+)\sscope.+#{dev}$/
            details["ipaddr"],details["prefix"],details["broadcast"] = $1, $2, $3 
          end
          
          if dev != /:/
            if line =~ /inet6\s(.+?)\/(\d+)\sscope/
              count += 1
              details["ip6"][count] = Hash.new
              details["ip6"][count]["ipaddr"],details["ip6"][count]["prefix"] = $1, $2 
            end
          end
        end
      else
        `ifconfig #{dev}`.each_line do |line|
        end
      end

      return details
    end

    def host_bus_adapters
      list = Array.new

      `lspci`.each_line do |line|
        if line =~ /fib|hba/i        
          
          list.push($1) if line =~ /.+?:\s+(.+)/ 
        end
      end

      return list
    end

  end
end
