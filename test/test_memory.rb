require 'test/unit'
require File.join(File.dirname(__FILE__),"../lib/informo/memory") if RUBY_VERSION.to_f < 1.9
require 'informo/memory' if RUBY_VERSION.to_f >= 1.9

class MemoryTest < Test::Unit::TestCase

  def test_max_module_size
    m = Informo::Memory.new
    assert_match /\d+/, m.max_module_size
  end

  def test_max_modules
    m = Informo::Memory.new
    assert_match /\d+/, m.max_modules
  end

  def test_max_capacity
    m = Informo::Memory.new
    assert_match /\d+/, m.max_capacity
  end

  def test_installed
    m = Informo::Memory.new
    assert_match /\d+/, m.installed
  end

  def test_slots
    m = Informo::Memory.new
    assert_match /\d+/, m.slots[0]['speed']
  end

end
