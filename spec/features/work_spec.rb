require "spec_helper"

describe "work", js: true, type: :feature, js_errors: true do
  before do
    visit '/work/'
  end

  it "has the correct title header" do
    expect(page).to have_selector ".heading_page"
    within ".heading_page" do
      expect(page).to have_content("Chances are, you’ve used one of our apps.")
    end
  end
end
