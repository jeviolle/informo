require 'test/unit'
require File.join(File.dirname(__FILE__),"../lib/informo/processor") if RUBY_VERSION.to_f < 1.9
require 'informo/processor' if RUBY_VERSION.to_f >= 1.9

class RPMTest < Test::Unit::TestCase
  ##
  ## required package for test.
  R_PKG = 'glibc'

  def test_get_packages
    rpm = Informo::Rpm.new
    packages = rpm_obj.get_packages
    assert_not_nil packages[0]
  end

  def test_get_version
    rpm = Informo::Rpm.new
    version = rpm.get_version(R_PKG)
    assert_match '/^\d/', version
  end

  def test_get_architecture
    rpm = Informo::Rpm.new
    arch = rpm.get_architecture(R_PKG)
    assert_match '/\w+(\d*)?/', arch
  end

  def test_get_maintainer
    rpm = Informo::Rpm.new
    maintainer = rpm.get_maintainer(R_PKG)
    assert_match '/\w+/', maintainer
  end

  def test_get_short_desc
    rpm = Informo::Rpm.new
    desc = rpm.get_short_description(R_PKG)
    assert_match '/\w+/', desc
  end

  def test_get_desc
    rpm = Informo::Rpm.new
    desc = rpm.get_description(R_PKG)
    assert_match '/\w+/', desc
  end

  def test_get_status
    rpm = Informo::Rpm.new
    status = rpm.get_status(R_PKG)
    assert_match 'ii', status
  end

  def test_get_installdate
    rpm = Informo::Rpm.new
    installdate = rpm.get_installdate(R_PKG)
    assert_match '/\d+/', installdate
  end

  def test_get_all
    rpm = Informo::Rpm.new
    pkg_details = rpm.get_all(R_PKG)
    assert_kind_of Hash, pkg_details
    assert_match '/\w+/', pkg_details['name']
    assert_match '/^\d/', pkg_details['version']
    assert_match '/\w+(\d*)?/', pkg_details['achitecture']
    assert_match '/\w+/', pkg_details['maintainer']
    assert_match '/\w+/', pkg_details['description']
    assert_match 'ii', pkg_details['status']
  end

end
