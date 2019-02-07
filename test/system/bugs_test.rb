require "application_system_test_case"

class BugsTest < ApplicationSystemTestCase
  setup do
    @bug = bugs(:one)
  end

  test "visiting the index" do
    visit bugs_url
    assert_selector "h1", text: "Bugs"
  end

  test "creating a Bug" do
    visit bugs_url
    click_on "New Bug"

    fill_in "Description", with: @bug.description
    fill_in "Issue type", with: @bug.issue_type
    fill_in "Priority", with: @bug.priority
    fill_in "Status", with: @bug.status
    fill_in "Title", with: @bug.title
    click_on "Create Bug"

    assert_text "Bug was successfully created"
    click_on "Back"
  end

  test "updating a Bug" do
    visit bugs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bug.description
    fill_in "Issue type", with: @bug.issue_type
    fill_in "Priority", with: @bug.priority
    fill_in "Status", with: @bug.status
    fill_in "Title", with: @bug.title
    click_on "Update Bug"

    assert_text "Bug was successfully updated"
    click_on "Back"
  end

  test "destroying a Bug" do
    visit bugs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bug was successfully destroyed"
  end
end
