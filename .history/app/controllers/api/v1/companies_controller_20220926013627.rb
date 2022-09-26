class Api::V1::CompaniesController < ApiController
    before_action :set_company, only: [:show]
    def index
        @companies = current_user.companies
        render json: @companies
    end

    def show
        render json: @company
    end


    private

    def set_company
        @company = current_user.companies.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        render json:error.message, status: :unauthorized
    end
end