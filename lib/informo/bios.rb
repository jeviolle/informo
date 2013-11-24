module Informo
  ##
  # Allows for the retrieval of bios related information.
  class BIOS
    ##
    # returns the serial number as a string
    def serial
      serial = `dmidecode -s system-serial-number`.chomp
      return serial
    end
    ##
    # returns the bios vendor as a string
    def vendor
      vendor = `dmidecode -s system-product-name`.chomp
      return vendor
    end
    ##
    # returns the bios version as a string
    def version
      version = `dmidecode -s bios-version`.chomp
      return version
    end
    ##
    # returns the release date of the installed bios version as a string
    def date
      date = `dmidecode -s bios-release-date`.chomp
      return date
    end
  end
end
