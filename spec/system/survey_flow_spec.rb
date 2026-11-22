require "rails_helper"

RSpec.describe "Survey flow", type: :system do
  before { driven_by :rack_test }

  it "creates a survey and submits a response" do
    visit new_survey_path

    fill_in "Title", with: "Training feedback"
    fill_in "Description", with: "How was the session?"
    click_button "Create Survey"

    expect(page).to have_content("Survey created.")

    fill_in "Respondent name", with: "Rihan"
    fill_in "Score (1-5)", with: "5"
    fill_in "Comment", with: "Clear and practical."
    click_button "Submit Response"

    expect(page).to have_content("Response submitted.")
    expect(page).to have_content("Rihan")
    expect(page).to have_content("5")
  end
end
