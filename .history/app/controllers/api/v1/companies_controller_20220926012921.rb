class Api::V1::CompaniesController < ApiController
    before_action :set_company, only: [:show]
    def index
        # @companies = Company.all
        @companies = current_user.companies
    end

    def show
        
    end


    private

    def set_company
        @company = Company.find(params[:id])
    end
end