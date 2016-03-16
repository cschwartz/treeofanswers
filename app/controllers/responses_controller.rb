class ResponsesController < ApplicationController
  before_action :authenticate_user!

  def index
    @responses = current_user.responses
  end

  def show
    @response = current_user.responses.find_by_id params[:id]
  end

  def update
    @response = current_user.responses.find_by_id(params[:id])
    @response.update_attributes(response_params.merge(status: :edited))

    if @response.save
      redirect_to @response, notice: 'Response successfully created'
    else
      flash.now[:alert] = 'Please answer the question or delegate it to someone who can.'
      render 'show'
    end
  end

  def response_params
    params.require(:response).permit(:description, :status, responses_attributes: [:id, :email, :_destroy])
  end
end
