class SurveysController < ApplicationController
  before_action :set_survey, only: :show

  def index
    @surveys = Survey.order(created_at: :desc)
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to @survey, notice: "Survey created."
    else
      render :new, status: 422
    end
  end

  def show
    @response = @survey.responses.new
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
