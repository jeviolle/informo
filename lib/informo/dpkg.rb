require 'time'

class DPKG
  def initialize()
    @@dpkgquery = "dpkg-query"
    @@pkginfo = "/var/lib/dpkg/info"
  end

  # return array of packages 
  def get_packages
    packages = Array.new
    packages = `#{@@dpkgquery} -W -f='${Package}\n'`.split("\n")
    return packages
  end

  def get_version(name)
    package_version = `#{@@dpkgquery} -W -f='${Version}' #{name}`
    return package_version
  end

  def get_architecture(name)
    package_architecture = `#{@@dpkgquery} -W -f='${Architecture}' #{name}`
    return package_architecture
  end

  def get_maintainer(name)
    package_maintainer = `#{@@dpkgquery} -W -f='${Maintainer}' #{name}`
    return package_maintainer
  end

  def get_short_description(name)
    package_description = `#{@@dpkgquery} -W -f='${Description}' #{name}`.split("\n")
    return package_description[0]
  end

  def get_description(name)
    package_description = `#{@@dpkgquery} -W -f='${Description}' #{name}`
    return package_description
  end

  def get_status(name)
    package_status = `#{@@dpkgquery} -W -f='${Status}' #{name}`
    return package_status
  end

  def get_installdate(name)
    create_time = Time.at(File.stat(@@pkginfo + "/#{name}.list")).ctime.utc
    return create_time
  end

  def get_all(name)
    results = `#{@@dpkgquery} -W -f='${Version}|||${Architecture}|||${Maintainer}|||${Description}|||${Status}' #{name}`.split('|||')

    # return results as an array and map
    hresults = {'name' => name, 'version' => results[0],
                'architecture' => results[1], 'maintainer' => results[2],
                'description' => results[3], 'status' => results[4]}

    return hresults
  end
end
