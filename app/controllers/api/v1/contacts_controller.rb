class Api::V1::ContactsController < ApplicationController
  def index
    contacts = Contact.where(user_id: current_user.id).order(created_at: :desc)

    respond_with contacts
  end

  def create
    months_collection = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    user = User.find(params[:contact][:user_id].to_i)
    contact = user.contacts.new(contact_params)

    if contact.save
      months_collection.each do |month|
        contact.months.create(name: month)
      end
      respond_with(contact, location: api_v1_contacts_path)
    else
      respond_with :json => [{ :error => "Error. Please try again." }], :status => 304
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
