require 'test/unit'
require_relative '../../app/coin_change'

class CoinChangeTest < Test::Unit::TestCase

  def setup
    @coin_change = CoinChange.new
  end

  def test_change_for_1_cents
    expected_change = {1 => 1, 5 => 0, 10 => 0, 25 => 0, 100 => 0}
    assert_equal expected_change, @coin_change.change_for(1)
  end

  def test_change_for_5_cents
    expected_change = {1 => 0, 5 => 1, 10 => 0, 25 => 0, 100 => 0}
    assert_equal expected_change, @coin_change.change_for(5)
  end

  def test_change_for_10_cents
    expected_change = {1 => 0, 5 => 0, 10 => 1, 25 => 0, 100 => 0}
    assert_equal expected_change, @coin_change.change_for(10)
  end

  def test_change_for_25_cents
    expected_change = {1 => 0, 5 => 0, 10 => 0, 25 => 1, 100 => 0}
    assert_equal expected_change, @coin_change.change_for(25)
  end

  def test_change_for_100_cents
    expected_change = {1 => 0, 5 => 0, 10 => 0, 25 => 0, 100 => 1}
    assert_equal expected_change, @coin_change.change_for(100)
  end

  def test_change_for_6_cents
    expected_change = {1 => 1, 5 => 1, 10 => 0, 25 => 0, 100 => 0}
    assert_equal expected_change, @coin_change.change_for(6)
  end

  def test_change_for_30_cents
    expected_change = {1 => 0, 5 => 1, 10 => 0, 25 => 1, 100 => 0}
    assert_equal expected_change, @coin_change.change_for(30)
  end

  def test_change_for_111_cents
    expected_change = {1 => 1, 5 => 0, 10 => 1, 25 => 0, 100 => 1}
    assert_equal expected_change, @coin_change.change_for(111)
  end

end