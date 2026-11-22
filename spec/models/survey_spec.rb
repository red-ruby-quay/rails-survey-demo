require "rails_helper"

RSpec.describe Survey, type: :model do
  it "is valid with a title" do
    expect(Survey.new(title: "Service feedback")).to be_valid
  end

  it "requires a title" do
    survey = Survey.new(title: "")

    expect(survey).not_to be_valid
    expect(survey.errors[:title]).to include("can't be blank")
  end

  it "returns 0.0 when there are no responses" do
    survey = Survey.create!(title: "Empty")

    expect(survey.average_score).to eq(0.0)
  end

  it "calculates the average score" do
    survey = Survey.create!(title: "Feedback")
    survey.responses.create!(respondent_name: "Ayu", score: 4)
    survey.responses.create!(respondent_name: "Bima", score: 2)

    expect(survey.average_score).to eq(3.0)
  end
end
