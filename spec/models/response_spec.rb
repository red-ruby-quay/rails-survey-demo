require "rails_helper"

RSpec.describe Response, type: :model do
  let(:survey) { Survey.create!(title: "Feedback") }

  it "is valid with a name and a score between 1 and 5" do
    response = survey.responses.new(respondent_name: "Ayu", score: 5)

    expect(response).to be_valid
  end

  it "requires a respondent name" do
    response = survey.responses.new(respondent_name: "", score: 4)

    expect(response).not_to be_valid
    expect(response.errors[:respondent_name]).to include("can't be blank")
  end

  it "rejects a score outside 1-5" do
    response = survey.responses.new(respondent_name: "Ayu", score: 0)

    expect(response).not_to be_valid
    expect(response.errors[:score]).to be_present
  end

  it "rejects a non-integer score" do
    response = survey.responses.new(respondent_name: "Ayu", score: 3.5)

    expect(response).not_to be_valid
    expect(response.errors[:score]).to be_present
  end
end
