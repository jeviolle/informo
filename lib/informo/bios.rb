class BIOS
  def serial
    serial = `dmidecode -s system-serial-number`.chomp
    return serial
  end

  def vendor
    vendor = `dmidecode -s system-product-name`.chomp
    return vendor
  end

  def version
    version = `dmidecode -s bios-version`.chomp
    return version
  end

  def date
    date = `dmidecode -s bios-release-date`.chomp
    return date
  end
end
