require_relative '../test_case'

class KarateTest < Test::Unit::TestCase
  def test_chop_empty_collection
    assert_equal -1, chop(3, [])
  end

  def test_chop_not_found_in_collection_with_single_item
    assert_equal -1, chop(3, [1])
  end

  def test_chop_found_in_collection_with_single_item
    assert_equal 0, chop(1, [1])
  end

  def test_chop_found_in_collection_with_more_items
    assert_equal 0, chop(1, [1, 3, 5])
    assert_equal 1, chop(3, [1, 3, 5])
    assert_equal 2, chop(5, [1, 3, 5])
  end

  def test_chop_not_found_in_collection_with_more_items
    assert_equal -1, chop(0, [1, 3, 5])
    assert_equal -1, chop(2, [1, 3, 5])
    assert_equal -1, chop(4, [1, 3, 5])
    assert_equal -1, chop(6, [1, 3, 5])
    assert_equal 0, chop(1, [1, 3, 5, 7])
    assert_equal 1, chop(3, [1, 3, 5, 7])
    assert_equal 2, chop(5, [1, 3, 5, 7])
    assert_equal 3, chop(7, [1, 3, 5, 7])
    assert_equal -1, chop(0, [1, 3, 5, 7])
    assert_equal -1, chop(2, [1, 3, 5, 7])
    assert_equal -1, chop(4, [1, 3, 5, 7])
    assert_equal -1, chop(6, [1, 3, 5, 7])
    assert_equal -1, chop(8, [1, 3, 5, 7])
  end

  private

  def chop(element_to_find, collection)
    Karate.new(collection).chop(element_to_find)
  end
end