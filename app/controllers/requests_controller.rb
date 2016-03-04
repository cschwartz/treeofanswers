class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = current_user.build_request(num_responses: 2)
  end

  def index
    @requests = current_user.requests
  end

  def show
    @request = current_user.requests.find_by_id params[:id]
  end

  def create
    @request = current_user.requests.build(request_params)
    if @request.save
      redirect_to @request, notice: 'Request successfully created'
    else
      render :new
    end
  end

  def request_params
    params.require(:request).permit(:description, responses_attributes: [:id, :email, :_destroy])
  end
end
