require "rails_helper"

RSpec.describe "Surveys", type: :request do
  it "lists surveys" do
    Survey.create!(title: "Employee pulse")

    get surveys_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Employee pulse")
  end

  it "creates a survey with valid attributes" do
    expect do
      post surveys_path, params: { survey: { title: "Training feedback", description: "Session quality" } }
    end.to change(Survey, :count).by(1)

    expect(response).to redirect_to(survey_path(Survey.last))
    follow_redirect!
    expect(response.body).to include("Survey created.")
  end

  it "rejects a survey without a title" do
    expect do
      post surveys_path, params: { survey: { title: "", description: "Missing title" } }
    end.not_to change(Survey, :count)

    expect(response).to have_http_status(422)
  end

  it "submits a response to a survey" do
    survey = Survey.create!(title: "Service feedback")

    expect do
      post survey_responses_path(survey), params: { response: { respondent_name: "Rihan", score: 5, comment: "Clear" } }
    end.to change(Response, :count).by(1)

    expect(response).to redirect_to(survey_path(survey))
  end
end
