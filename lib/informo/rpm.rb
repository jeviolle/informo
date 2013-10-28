require 'time'
  
module Informo
  class RPM
    def initialize()
      @@rpmquery = "rpm"
    end
  
    # return array of packages 
    def get_packages
      packages = Array.new
      packages = `#{@@rpmquery} -qa --qf='%{NAME}\n'`.split("\n")
      return packages
    end
  
    def get_version(name)
      package_version = `#{@@rpmquery} -q --qf='%{VERSION}' #{name}`
      return package_version
    end
  
    def get_release(name)
      package_release = `#{@@rpmquery} -q --qf='%{RELEASE}' #{name}`
      return package_release
    end
  
    def get_architecture(name)
      package_architecture = `#{@@rpmquery} -q --qf='%{ARCH}' #{name}`
      return package_architecture
    end
  
    def get_maintainer(name)
      package_maintainer = `#{@@rpmquery} -q --qf='%{VENDOR}' #{name}`
      return package_maintainer
    end
  
    def get_short_description(name)
      package_description = `#{@@rpmquery} -q --qf='%{SUMMARY}' #{name}`.split("\n")
      return package_description[0]
    end
  
    def get_description(name)
      package_description = `#{@@rpmquery} -q --qf='%{DESCRIPTION}' #{name}`
      return package_description
    end
  
    def get_installdate(name)
      package_status = Time.at(Time.parse(`#{@@rpmquery} -q --qf='%{INSTALLTIME:date}' #{name}`)).utc
      return package_status
    end
  
    def get_status(name)
      return 
    end
  
    def get_all(name)
      results = `#{@@rpmquery} -q --queryformat "%{VERSION}|||%{RELEASE}|||%{ARCH}|||%{VENDOR}|||%{SUMMARY}|||%{DESCRIPTION}|||%{INSTALLTIME:date}" #{name}`.split('|||')
  
      # return results as an array and map
      hresults = {'name' => name, 'version' => results[0], 'release' => results[1],
                  'architecture' => results[2], 'maintainer' => results[3], 'summary' => results[4],
                  'description' => results[5], 'installdate' => results[6]}
  
      return hresults
    end
  end
end
