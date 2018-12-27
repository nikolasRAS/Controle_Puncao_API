require 'test_helper'

class AgeRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @age_range = age_ranges(:one)
  end

  test "should get index" do
    get age_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_age_range_url
    assert_response :success
  end

  test "should create age_range" do
    assert_difference('AgeRange.count') do
      post age_ranges_url, params: { age_range: { description: @age_range.description } }
    end

    assert_redirected_to age_range_url(AgeRange.last)
  end

  test "should show age_range" do
    get age_range_url(@age_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_age_range_url(@age_range)
    assert_response :success
  end

  test "should update age_range" do
    patch age_range_url(@age_range), params: { age_range: { description: @age_range.description } }
    assert_redirected_to age_range_url(@age_range)
  end

  test "should destroy age_range" do
    assert_difference('AgeRange.count', -1) do
      delete age_range_url(@age_range)
    end

    assert_redirected_to age_ranges_url
  end
end
