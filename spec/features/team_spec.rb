require "spec_helper"

describe "team", js: true, type: :feature, js_errors: true do
  before do
    visit '/team/'
  end

  it "has the correct title header" do
    expect(page).to have_selector ".heading_page"
    within ".heading_page" do
      expect(page).to have_content("Thinkers, innovators, cyclists, climbers, foodies.")
    end
  end
end
