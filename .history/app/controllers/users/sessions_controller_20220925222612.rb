# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   respond_to :json
 
  private
  def respond_with(resource, options={})
      render json: {
        status: {code: 200, message: "Sign In successfully", data: current_user.}
      }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],Rails.application.credentials.fetch(:secret_key_base)).first
  end
end
