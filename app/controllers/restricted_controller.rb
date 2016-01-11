class RestrictedController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { 'message': 'You are authorized' }, status: 200
  end
end