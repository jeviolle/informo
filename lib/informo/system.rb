require 'socket'
  
module Informo
  ##
  # This class is used to get some generic information of the
  # host in question; ie: distro name, version, etc
  class SYSTEM
    ##
    # returns the linux distro 
    def distro
      `lsb_release -i`.each_line do |line|
        distro = $1 if line =~ /.+:\s(.+)$/
        return distro
      end
    end
    ##
    # returns the version of the linux distro
    def version
      `lsb_release -r`.each_line do |line|
        version = $1 if line =~ /.+:\s(.+)$/
        return version
      end
    end
    ##
    # returns a boolean for wether or not numa is being used
    def numa?
      enabled = system("numactl","-s") ? true : false  
      return enabled
    end
    ##
    # returns the running kernel version
    def kernel
      File.open("/proc/version").each_line do |line|
        kernel = $1 if line =~ /version (.+?) /
        return kernel
      end
    end
    ##
    # returns the architecture of the system (i386, x86_64, etc)
    def arch
      arch = `uname -m`.chomp
      return arch
    end
    ##
    # returns the hostname of the system
    def hostname
      return Socket.gethostname
    end
  end
end
