require 'test/unit'
require File.join(File.dirname(__FILE__),"../lib/informo/dpkg") if RUBY_VERSION.to_f < 1.9
require 'informo/dpkg' if RUBY_VERSION.to_f >= 1.9

class DpkgTest < Test::Unit::TestCase
  ##
  # required package for test. this package is requried on every debian/ubuntu system
  R_PKG = 'glibc'

  def test_get_packages
    dpkg = Informo::Dpkg.new
    packages = dpkg.get_packages
    assert_not_nil packages[0]
  end

  def test_get_version
    dpkg = Informo::Dpkg.new
    version = dpkg.get_version(R_PKG)
    assert_match '/^\d/', version
  end

  def test_get_architecture
    dpkg = Informo::Dpkg.new
    arch = dpkg.get_architecture(R_PKG)
    assert_match '/\w+(\d*)?/', arch
  end

  def test_get_maintainer
    dpkg = Informo::Dpkg.new
    maintainer = dpkg.get_maintainer(R_PKG)
    assert_match '/\w+/', maintainer
  end

  def test_get_short_desc
    dpkg = Informo::Dpkg.new
    desc = dpkg.get_short_description(R_PKG)
    assert_match '/\w+/', desc
  end

  def test_get_desc
    dpkg = Informo::Dpkg.new
    desc = dpkg.get_description(R_PKG)
    assert_match '/\w+/', desc
  end

  def test_get_status
    dpkg = Informo::Dpkg.new
    status = dpkg.get_status(R_PKG)
    assert_match 'ii', status
  end

  def test_get_installdate
    dpkg = Informo::Dpkg.new
    installdate = dpkg.get_installdate(R_PKG)
    assert_match '/\d+/', installdate
  end

  def test_get_all
    dpkg = Informo::Dpkg.new
    pkg_details = dpkg.get_all(R_PKG)
    assert_kind_of Hash, pkg_details
    assert_match '/\w+/', pkg_details['name']
    assert_match '/^\d/', pkg_details['version']
    assert_match '/\w+(\d*)?/', pkg_details['achitecture']
    assert_match '/\w+/', pkg_details['maintainer']
    assert_match '/\w+/', pkg_details['description']
    assert_match 'ii', pkg_details['status']
  end

end
