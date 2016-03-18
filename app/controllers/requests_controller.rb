class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = current_user.build_request(num_responses: 2)
  end

  def index
    @requests = current_user.requests
  end

  def show
    # TODO: make sure the user is allowed to read this, i.e.
    # check if one of the responses of the user has a root
    # with the given id
    @request = Request.find_by_id params[:id]
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
    responses_attributes = {
      responses_attributes: [:id, :email, :_destroy]
    }

    params.require(:request).permit(:description, responses_attributes)
  end
end
