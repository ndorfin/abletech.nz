require "spec_helper"

describe "error handler", js: true, type: :feature, js_errors: true do
  before do
    visit '/404/'
  end

  it "has the correct title header" do
    expect(page).to have_selector ".circle_heading"
    within ".circle_heading" do
      expect(page).to have_content("Uh oh. You're lost.")
    end
  end
end
