require 'test/unit'
require File.join(File.dirname(__FILE__),"../lib/informo/bios") if RUBY_VERSION.to_f < 1.9
require 'informo/bios' if RUBY_VERSION.to_f >= 1.9

class BiosTest < Test::Unit::TestCase

  def test_version
    b = Informo::BIOS.new
    assert_match '.+?', b.version
  end

  def test_serial
    b = Informo::BIOS.new
    assert_match '.+?', b.serial
  end

  def test_vendor
    b = Informo::BIOS.new
    assert_match '.+?', b.vendor
  end

  def test_date
    b = Informo::BIOS.new
    assert_match '/d+\/\d+\/\d+', b.date
  end

end
