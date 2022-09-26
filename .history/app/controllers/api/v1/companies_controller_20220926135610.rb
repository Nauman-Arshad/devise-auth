class Api::V1::CompaniesController < ApiController
    before_action :set_company, only: [:show, :update, :destroy ]
    def index
        @companies = Company.all
        # @companies = current_user.companies
        render json: @companies
    end

    def show
        render json: @company, status: :ok
    end

    def create
        @company = current_user.companies.new(c_params)
        if @company.save
            render json: @company, status: :ok
        else
            render json: {data: @company.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @company.update(c_params)
            render json: @company, status: :ok
        else
            render json: {data: @company.errors.full_messages}, status: "failed"
        end
    end

    def destroy
        if @company.destroy
            render json: {data: 'company destroy successfully'}, status: :ok
        else
            render json: {data: 'company destroy failed'}, status: "failed"
        end
    end


    private

    def set_company
        @company = current_user.companies.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        render json:error.message, status: :unauthorized
    end
    def c_params
        params.require(:company).permit(:name, :address, :established_year, :user_id)
    end
end