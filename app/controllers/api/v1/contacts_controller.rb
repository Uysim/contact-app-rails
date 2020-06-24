module Api::V1
  class ContactsController < BaseController
    before_action :find_contact, only: [:show, :update]

    def index
      @contacts = Contact.all.filters(params).order(updated_at: :desc).with_attached_avatar.page(params[:page])
      render json: @contacts, include: [:name, :email, :avatar_url, :created_at, :updated_at]
    end

    def show
      render json: @contact
    end

    def update

      if @contact.update(permitted_params)
        render json: @contact
      else
        render json: {
          errors: @contact.errors
        }, status: :unprocessable_entity
      end
    end


    private

    def find_contact
      @contact = Contact.find params[:id]
    end

    def permitted_params
      params.permit(:name, :email, :avatar, :bio)
    end
  end
end
