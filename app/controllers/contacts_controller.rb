class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    user = current_user
    contact = user.contacts.new(contact_params)
    if contact.save
      redirect_to root_path
      flash[:success] = 'Contact created'
    else
      flash.now[:error] = contact.errors.full_messages.join(', ')
      redirect_to :root_path
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone, :linked_in, :twitter, :other, :user_id)
    end
end
