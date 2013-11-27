require 'test/unit'
require 'Informo'

class ProcessorTest < Test::Unit::TestCase

  def test_count
    p = Informo::PROCESSOR.new
    assert_match '/\d+/', p.count
  end

  def test_details
    p = Informo::PROCESSOR.new
    details = p.details
    assert_match '/MHz/', details[0]['cpu_MHz']
  end

end
