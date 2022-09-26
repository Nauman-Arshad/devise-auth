class ApiController < ApplicationController
    before_action :authenticate_user!
rescue_from CanCan::AccessDenied do |execption|
    render json: {warning: execption, status: 'authorization_failed'}
end
end