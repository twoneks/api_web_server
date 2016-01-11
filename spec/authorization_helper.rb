require 'rails_helper'

module AuthorizationHelper
  def self.authenticate_user(user, request)
    authenticated_header = user.create_new_auth_token
    request.headers['client'] = authenticated_header['client']
    request.headers['access-token'] = authenticated_header['access-token']
    request.headers['uid'] = authenticated_header['uid']
  end
end