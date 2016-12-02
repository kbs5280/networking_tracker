class Api::V1::MonthsController < ApplicationController
  def index
    contacts = Contact.where(user_id: current_user.id).order(created_at: :desc)
    contact_months = contacts.map do |contact|
      contact.months.all
    end

    respond_with contact_months
  end
end
