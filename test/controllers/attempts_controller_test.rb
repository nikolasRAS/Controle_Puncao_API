require 'test_helper'

class AttemptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attempt = attempts(:one)
  end

  test "should get index" do
    get attempts_url
    assert_response :success
  end

  test "should get new" do
    get new_attempt_url
    assert_response :success
  end

  test "should create attempt" do
    assert_difference('Attempt.count') do
      post attempts_url, params: { attempt: { d_puncture: @attempt.d_puncture, observation_id: @attempt.observation_id, record_id: @attempt.record_id, try: @attempt.try, worker_id: @attempt.worker_id } }
    end

    assert_redirected_to attempt_url(Attempt.last)
  end

  test "should show attempt" do
    get attempt_url(@attempt)
    assert_response :success
  end

  test "should get edit" do
    get edit_attempt_url(@attempt)
    assert_response :success
  end

  test "should update attempt" do
    patch attempt_url(@attempt), params: { attempt: { d_puncture: @attempt.d_puncture, observation_id: @attempt.observation_id, record_id: @attempt.record_id, try: @attempt.try, worker_id: @attempt.worker_id } }
    assert_redirected_to attempt_url(@attempt)
  end

  test "should destroy attempt" do
    assert_difference('Attempt.count', -1) do
      delete attempt_url(@attempt)
    end

    assert_redirected_to attempts_url
  end
end
