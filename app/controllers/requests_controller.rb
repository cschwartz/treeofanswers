class RequestsController < ApplicationController
  before_action :authenticate_user!


  def new
    @request = current_user.nodes.build
  end
end
