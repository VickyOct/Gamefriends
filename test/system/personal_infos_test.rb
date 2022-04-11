require "application_system_test_case"

class PersonalInfosTest < ApplicationSystemTestCase
  setup do
    @personal_info = personal_infos(:one)
  end

  test "visiting the index" do
    visit personal_infos_url
    assert_selector "h1", text: "Personal infos"
  end

  test "should create personal info" do
    visit personal_infos_url
    click_on "New personal info"

    fill_in "Age", with: @personal_info.age
    fill_in "Country", with: @personal_info.country
    fill_in "Phone", with: @personal_info.phone
    fill_in "Twitter", with: @personal_info.twitter
    click_on "Create Personal info"

    assert_text "Personal info was successfully created"
    click_on "Back"
  end

  test "should update Personal info" do
    visit personal_info_url(@personal_info)
    click_on "Edit this personal info", match: :first

    fill_in "Age", with: @personal_info.age
    fill_in "Country", with: @personal_info.country
    fill_in "Phone", with: @personal_info.phone
    fill_in "Twitter", with: @personal_info.twitter
    click_on "Update Personal info"

    assert_text "Personal info was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal info" do
    visit personal_info_url(@personal_info)
    click_on "Destroy this personal info", match: :first

    assert_text "Personal info was successfully destroyed"
  end
end
