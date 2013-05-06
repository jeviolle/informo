require 'socket'

module Informo
  class SYSTEM
    def distro
      `lsb_release -i`.each_line do |line|
        distro = $1 if line =~ /.+:\s(.+)$/
        return distro
      end
    end

    def version
      `lsb_release -r`.each_line do |line|
        version = $1 if line =~ /.+:\s(.+)$/
        return version
      end
    end

    def numa?
      enabled = system("numactl","-s") ? true : false  
      return enabled
    end

    def kernel
      File.open("/proc/version").each_line do |line|
        kernel = $1 if line =~ /version (.+?) /
        return kernel
      end
    end

    def arch
      arch = `uname -m`.chomp
      return arch
    end

    def hostname
      return Socket.gethostname
    end
  end
end
