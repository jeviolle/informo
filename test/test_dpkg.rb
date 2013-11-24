require 'test/unit'
require 'Informo'

class DpkgTest < Test::Unit::TestCase
  ##
  # required package for test. this package is requried on every debian/ubuntu system
  R_PKG = 'glibc'

  def test_get_packages
    dpkg = Informo::DPKG.new
    packages = dpkg.get_packages
    assert_not_nil packages[0]
  end

  def test_get_version
    dpkg = Informo::DPKG.new
    version = dpkg.get_version(R_PKG)
    assert_match '/\d+/', version
  end

  def test_get_architecture
    dpkg = Informo::DPKG.new
    arch = dpkg.get_architecture(R_PKG)
    assert_match '/\w+(\d*)?/', arch
  end

  def test_get_maintainer
    dpkg = Informo::DPKG.new
    maintainer = dpkg.get_maintainer(R_PKG)
    assert_match '\w+', maintainer
  end

end
