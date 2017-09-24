class ContactsController < ApplicationController
  
  def index
    @contacts = current_user.contacts.order(:full_name)
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = current_user.contacts.find(params[:id])
  end

  def update
    @contact = current_user.contacts.find(params[:id])
    @contact.update(contact_params)

    redirect_to contacts_path
  end

  def create
    @contact = Contact.create(contact_params.merge(user: current_user))
    
    flash[:error] = 'A contact needs least a name and a phone number or email address' unless @contact.valid?
    
    redirect_to contacts_path
   

  end

  private
    def contact_params
      params.require(:contact).permit(:full_name, :phone_number, :email)
    end

end