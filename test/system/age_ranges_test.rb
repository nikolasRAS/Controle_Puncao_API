require "application_system_test_case"

class AgeRangesTest < ApplicationSystemTestCase
  setup do
    @age_range = age_ranges(:one)
  end

  test "visiting the index" do
    visit age_ranges_url
    assert_selector "h1", text: "Age Ranges"
  end

  test "creating a Age range" do
    visit age_ranges_url
    click_on "New Age Range"

    fill_in "Description", with: @age_range.description
    click_on "Create Age range"

    assert_text "Age range was successfully created"
    click_on "Back"
  end

  test "updating a Age range" do
    visit age_ranges_url
    click_on "Edit", match: :first

    fill_in "Description", with: @age_range.description
    click_on "Update Age range"

    assert_text "Age range was successfully updated"
    click_on "Back"
  end

  test "destroying a Age range" do
    visit age_ranges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Age range was successfully destroyed"
  end
end
