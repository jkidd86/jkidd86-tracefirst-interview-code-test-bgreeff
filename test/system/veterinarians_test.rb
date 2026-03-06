require "application_system_test_case"

class VeterinariansTest < ApplicationSystemTestCase
  setup do
    @veterinarian = veterinarians(:one)
  end

  test "visiting the index" do
    visit veterinarians_url
    assert_selector "h1", text: "Veterinarians"
  end

  test "creating a Veterinarian" do
    visit veterinarians_url
    click_on "New Veterinarian"

    click_on "Create"

    assert_text "Veterinarian was successfully created"
    click_on "Back"
  end

  test "updating a Veterinarian" do
    visit veterinarians_url
    click_on "Edit", match: :first

    click_on "Update"

    assert_text "Veterinarian was successfully updated"
    click_on "Back"
  end

  test "destroying a Veterinarian" do
    visit veterinarians_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Veterinarian was successfully destroyed"
  end

  test "destroying a veterinarian with associated tests from index shows error message" do
    visit veterinarians_url

    row = find("tr", text: veterinarians(:with_tests).name)
    accept_confirm do
      row.click_on "Destroy"
    end

    assert_text "Veterinarian cannot be deleted while it has associated tests"
  end

  test "destroying a veterinarian with associated tests from show page shows error message" do
    visit veterinarian_url(veterinarians(:with_tests))
    accept_confirm do
      click_on "Destroy"
    end

    assert_text "Veterinarian cannot be deleted while it has associated tests"
  end
end
