class ResponsesController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.new(response_params)

    if @response.save
      redirect_to @survey, notice: "Response submitted."
    else
      render "surveys/show", status: 422
    end
  end

  private

  def response_params
    params.require(:response).permit(:respondent_name, :score, :comment)
  end
end
