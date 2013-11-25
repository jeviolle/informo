require 'test/unit'
require 'Informo'

class MemoryTest < Test::Unit::TestCase

  def test_max_module_size
    m = Informo::MEMORY.new
    assert_match '/\d+/', m.max_module_size
  end

  def test_max_modules
    m = Informo::MEMORY.new
    assert_match '/\d+/', m.max_modules
  end

  def test_max_capacity
    m = Informo::MEMORY.new
    assert_match '/\d+/', m.max_capacity
  end

  def test_installed
    m = Informo::MEMORY.new
    assert_match '/\d+/', m.installed
  end

  def test_slots
  end

end
