class ContactsController < ApplicationController
  def index
    redirect_to home_path if !current_user
    @months = Month.list
  end
end
