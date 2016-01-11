require 'rails_helper'
require 'authorization_helper'
RSpec.describe RestrictedController, type: :controller do
  context 'when user is logged in' do
    before :each do
      @logged_user = create :user
      AuthorizationHelper.authenticate_user(@logged_user, @request)
    end

    it 'return 200 status' do
      get :index, foremat: 'json'
      json = JSON.parse(response.body)
      expect(json['message']).to eq 'You are authorized'
    end
  end

  context 'when user is not logged in' do
    it 'return 401 status' do
      get :index, foremat: 'json'
      json = JSON.parse(response.body)
      puts json
      expect(json['errors']).to include 'Authorized users only.'
    end
  end
end