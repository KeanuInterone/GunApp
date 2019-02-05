require "application_system_test_case"

class GunsTest < ApplicationSystemTestCase
  setup do
    @gun = guns(:one)
  end

  test "visiting the index" do
    visit guns_url
    assert_selector "h1", text: "Guns"
  end

  test "creating a Gun" do
    visit guns_url
    click_on "New Gun"

    fill_in "Brand", with: @gun.brand
    fill_in "Caliber", with: @gun.caliber
    fill_in "Name", with: @gun.name
    click_on "Create Gun"

    assert_text "Gun was successfully created"
    click_on "Back"
  end

  test "updating a Gun" do
    visit guns_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @gun.brand
    fill_in "Caliber", with: @gun.caliber
    fill_in "Name", with: @gun.name
    click_on "Update Gun"

    assert_text "Gun was successfully updated"
    click_on "Back"
  end

  test "destroying a Gun" do
    visit guns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gun was successfully destroyed"
  end
end
