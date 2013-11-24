module Informo
  ##
  # This class is used to get info for the available and configured storage. For
  # example: number of disks, partition info, etc...
  class STORAGE
    ##
    # returns the total number of disks 
    def drive_count
      count = 0
      `fdisk -l 2>/dev/null`.each_line do |line|
        if line =~ /^Disk \/dev\/[^mapper]/
          count += 1
        end
      end
  
      return count
    end
    ##
    # returns the details for a given disk
    # 
    # - size
    # - model
    # - interface (scsi, sas, ide)
    def drive_details(disk)
      details = Hash.new
  
      `fdisk -l #{disk} 2>/dev/null`.each_line do |i|
        details["size"] = $1 if i =~ /^Disk \/\w+\/\w+\:\s+(\d+.+\w+)\,/
      end
  
      `hdparm -i #{disk} 2>/dev/null`.each_line do |i|
        details["model"] = $1 if i =~ /Model=(.+?)\,/
      end
  
      File.exists?("/sbin/udevadm") ? cmd = "udevadm info" : cmd = "udevinfo"
  
      `#{cmd} -q symlink -n #{disk}`.each_line do |i|
        details["interface"] = $1 if i =~ /disk\/by-path\/\w+-\d+:\d+:\d+\.\d+-(\w+)-\d+:\d+/
      end
      
      return details
    end
    ##
    # returns an array of disks present
    def drives
      drives = Array.new
      `fdisk -l 2>/dev/null`.each_line do |line|
        if line =~ /^Disk (\/\w+\/\w+)\:/
          drives.push($1)
        end
      end
  
      return drives
    end
    ##
    # returns a hash of details for a given mount
    #
    # - device (/dev/sda? etc)
    # - mount (/foo)
    # - fstype (ext4)
    # - options (mount options; eg: ro)
    def mount_details(mountpoint)
      details = Hash.new
      File.open("/proc/mounts").each_line do |line|
        entry = line.split(/\s/)
        if line != /rootfs/ and entry[1] == mountpoint
          details["device"] = entry[0]
          details["mount"] = entry[1]
          details["fstype"] = entry[2]
          details["options"] = entry[3]
        end
      end
  
      return details
    end
    ##
    # returns an array of mounts that are mounted
    def mounts(type=".+")
      mounts = Array.new
      File.open("/proc/mounts").each_line do |line|
        mounts.push(line.split(/\s/)[1]) if line != /rootfs/ and line.split(/\s/)[2] =~ /#{type}/
      end
  
      return mounts
    end
  
  end
end
