require 'test/unit'
require 'Informo'

class NetworkTest < Test::Unit::TestCase

  def test_interfaces
    n = Informo::NETWORK.new
    interfaces = n.interfaces
    assert_match '/\w+\d+/', interfaces[0]
  end

  def test_inteface_details
    n = Informo::NETWORK.new
    details = n.inteface_details('lo')
    assert_equal '127.0.0.1', details['addr']
  end

  def test_host_bus_adapters
    n = Informo::NETWORK.new
    hbas = n.host_bus_adapters
    assert_not_nil hbas
  end

end