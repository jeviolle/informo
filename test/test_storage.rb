require 'test/unit'
require File.join(File.dirname(__FILE__),"../lib/informo/storage") if RUBY_VERSION.to_f < 1.9
require 'informo/storage' if RUBY_VERSION.to_f >= 1.9

class StorageTest < Test::Unit::TestCase

  def test_drive_count
    s = Informo::Storage.new
    assert_kind_of Integer, s.drive_count
  end

  def test_drive_details
    s = Informo::Storage.new
    drives = s.drives
    size = s.drive_details(drives[0])['size']
    assert_match /^\d.+/, size
  end

  def test_mount_details
    s = Informo::Storage.new
    assert_not_nil s.mount_details('/')
  end

  def test_mounts
    s = Informo::Storage.new
    assert_not_nil s.mounts
  end

end
