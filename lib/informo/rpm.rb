require 'time'
  
module Informo
  ##
  # This class is used to get information about installed RPMs
  class RPM
    def initialize()
      @@rpmquery = "rpm"
    end
    ## 
    # returns an array of installed package names
    def get_packages
      packages = Array.new
      packages = `#{@@rpmquery} -qa --qf='%{NAME}\n'`.split("\n")
      return packages
    end
    ##
    # returns the version of the given package
    def get_version(name)
      package_version = `#{@@rpmquery} -q --qf='%{VERSION}' #{name}`
      return package_version
    end
    ##
    # returns the release of the given package
    def get_release(name)
      package_release = `#{@@rpmquery} -q --qf='%{RELEASE}' #{name}`
      return package_release
    end
    ##
    # returns the architecture of the given package
    def get_architecture(name)
      package_architecture = `#{@@rpmquery} -q --qf='%{ARCH}' #{name}`
      return package_architecture
    end
    ##
    # returns the maintainer of the given package
    def get_maintainer(name)
      package_maintainer = `#{@@rpmquery} -q --qf='%{VENDOR}' #{name}`
      return package_maintainer
    end
    ##
    # returns the +short+ description (ie: rpm summary field) of the given package
    def get_short_description(name)
      package_description = `#{@@rpmquery} -q --qf='%{SUMMARY}' #{name}`.split("\n")
      return package_description[0]
    end
    ##
    # returns the +full+ description of the given package
    def get_description(name)
      package_description = `#{@@rpmquery} -q --qf='%{DESCRIPTION}' #{name}`
      return package_description
    end
    ##
    # returns the installed date of the given package
    def get_installdate(name)
      package_status = Time.at(Time.parse(`#{@@rpmquery} -q --qf='%{INSTALLTIME:date}' #{name}`)).utc
      return package_status
    end
    ##
    # returns the status of the installed package (ie. nothing for RPM), kind of a placeholder I guess...
    def get_status(name)
      return 
    end
    ##
    # returns a hash of details for the given package
    #
    # - version
    # - release
    # - architecture
    # - maintainer
    # - summary
    # - description
    # - install date
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
