require "spec_helper"

describe "index", js: true, type: :feature, js_errors: true do
  before do
    visit '/'
  end

  it "has the correct title header" do
    expect(page).to have_selector ".heading_page"
    within ".heading_page" do
      expect(page).to have_content("We turn ideas")
    end
  end
end
