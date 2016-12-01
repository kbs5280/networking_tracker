class Api::V1::ContactsController < ApplicationController
  def index
  end

  def create
    user = User.find(params[:contact][:user_id].to_i)
    contact = user.contacts.new(contact_params)
    if contact.save
      respond_with(contact, location: api_v1_contacts_path)
    else
      respond_with :json => [{ :error => "An error was encountered while processing your request. Please try again." }], :status => 304
    end
  end

  private

    def contact_params
      params.require(:contact).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :linked_in,
        :twitter,
        :other,
        :user_id
      )
    end
end
