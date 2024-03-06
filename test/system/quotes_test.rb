require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test "showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Creating a new quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    fill_in "Name", with: "Test Quote"
    click_on "Create Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Test Quote"
  end
  
  test "Deleting a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
