class ApiController < ApplicationController
    before_action :authenticate_user!
rescue_from CanCan::AccessDenied do |execption|
    render json: {warning: exception, status: 'authorization_denied'}
end
end