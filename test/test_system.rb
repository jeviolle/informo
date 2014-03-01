require 'test/unit'
require File.join(File.dirname(__FILE__),"../lib/informo/system") if RUBY_VERSION.to_f < 1.9
require 'informo/system' if RUBY_VERSION.to_f >= 1.9

class SystemTest < Test::Unit::TestCase

  def test_distro
    s = Informo::System.new
    assert_not_nil s.distro
  end

  def test_version
    s = Informo::System.new
    assert_match /^\d/, s.version
  end

  def test_numa
    s = Informo::System.new
    assert_not_nil s.numa?
  end

  def test_kernel
    s = Informo::System.new
    assert_not_nil s.kernel
  end

  def test_arch
    s = Informo::System.new
    assert_not_nil s.arch
  end

  def test_hostname
    s = Informo::System.new
    assert_not_nil s.hostname
  end

end
