class Api::V1::CompaniesController < ApiController
    before_action :set_company, only: [:show]
    def index
        @companies = current_user.companies
    end

    def show
        
    end


    private

    def set_company
        @company = current_user.companies.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    end
end