require "application_system_test_case"

class AttemptsTest < ApplicationSystemTestCase
  setup do
    @attempt = attempts(:one)
  end

  test "visiting the index" do
    visit attempts_url
    assert_selector "h1", text: "Attempts"
  end

  test "creating a Attempt" do
    visit attempts_url
    click_on "New Attempt"

    fill_in "D Puncture", with: @attempt.d_puncture
    fill_in "Observation", with: @attempt.observation_id
    fill_in "Record", with: @attempt.record_id
    fill_in "Try", with: @attempt.try
    fill_in "Worker", with: @attempt.worker_id
    click_on "Create Attempt"

    assert_text "Attempt was successfully created"
    click_on "Back"
  end

  test "updating a Attempt" do
    visit attempts_url
    click_on "Edit", match: :first

    fill_in "D Puncture", with: @attempt.d_puncture
    fill_in "Observation", with: @attempt.observation_id
    fill_in "Record", with: @attempt.record_id
    fill_in "Try", with: @attempt.try
    fill_in "Worker", with: @attempt.worker_id
    click_on "Update Attempt"

    assert_text "Attempt was successfully updated"
    click_on "Back"
  end

  test "destroying a Attempt" do
    visit attempts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attempt was successfully destroyed"
  end
end
