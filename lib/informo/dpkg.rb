require 'time'

module Informo  
  ##
  # This class is used to return information about installed packages
  # for systems utilizing debian/ubuntu package formats
  class DPKG
    def initialize()
      @@dpkgquery = "dpkg-query"
      @@pkginfo = "/var/lib/dpkg/info"
    end
    ## 
    # returns an array of package names that are/were installed
    # as show via +dpkg-query+ command
    def get_packages
      packages = Array.new
      packages = `#{@@dpkgquery} -W -f='${Package}\n'`.split("\n")
      return packages
    end
    ##
    # returns the version of the package specified as a string
    def get_version(name)
      package_version = `#{@@dpkgquery} -W -f='${Version}' #{name}`
      return package_version
    end
    ##
    # returns the architecture of the package specified as a string
    def get_architecture(name)
      package_architecture = `#{@@dpkgquery} -W -f='${Architecture}' #{name}`
      return package_architecture
    end
    ##
    # returns the package maintainer for the given package as a string
    def get_maintainer(name)
      package_maintainer = `#{@@dpkgquery} -W -f='${Maintainer}' #{name}`
      return package_maintainer
    end
    ##
    # returns a brief description of a given package as a string
    def get_short_description(name)
      package_description = `#{@@dpkgquery} -W -f='${Description}' #{name}`.split("\n")
      return package_description[0]
    end
    ##
    # returns the full, possibly lengthy, description for the specified package as a string
    def get_description(name)
      package_description = `#{@@dpkgquery} -W -f='${Description}' #{name}`
      return package_description
    end
    ##
    # returns the status for the package specified as a string
    def get_status(name)
      package_status = `#{@@dpkgquery} -W -f='${Status}' #{name}`
      return package_status
    end
    ##
    # returns the installation date of the given package 
    def get_installdate(name)
      create_time = Time.at(File.stat(@@pkginfo + "/#{name}.list")).ctime.utc
      return create_time
    end
    ##
    # returns the following information for a given package name as a hash
    #
    # - version
    # - architecture
    # - maintainer
    # - description
    # - status
    def get_all(name)
      results = `#{@@dpkgquery} -W -f='${Version}|||${Architecture}|||${Maintainer}|||${Description}|||${Status}' #{name}`.split('|||')
  
      # return results as an array and map
      hresults = {'name' => name, 'version' => results[0],
                  'architecture' => results[1], 'maintainer' => results[2],
                  'description' => results[3], 'status' => results[4]}
  
      return hresults
    end
  end
end
