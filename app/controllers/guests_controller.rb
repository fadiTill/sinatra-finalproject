

class GuestsController < ApplicationController

   

    get "/guests/new" do
        if logged_in?
        erb :"guests/new"
        else
        redirect "/"    
     end
    end

 post "/guests" do
        # @guest = Guest.new(params)
        #  @user = current_user
        # binding.pry
         @guest = current_user.guests.build(params)
        # binding.pry
    if  @guest.save
        redirect "/guests/#{@guest.id}"
    else 
        erb :"guests/new"
    end
  end

   
 
   get "/guests/:id" do  
    if logged_in?  
     find_guest(params[:id])
        erb :"guests/show"
    else
        redirect "/"    
     end
    end


    get "/guests" do
      if logged_in?
       @guests = Guest.all
       @guests = current_user.guests
       erb :"guests/index"
    else
    redirect "/"    
 end
end


    get "/guests/:id/edit" do
         find_guest(params[:id])
        erb :"guests/edit"
   end

    


     patch "/guests/:id" do    
         find_guest(params[:id])
        @guest_params = update_whiltelist(params)
        @guest.update(@guest_params)
        # binding.pry
         redirect "/guests/#{@guest.id}"
     end
    




delete "/guests/:id" do
 find_guest(params[:id])
  @guest.delete
if @guest.errors
    redirect to "guests/new"
else
    erb :"/guests/#{@guest.id}"
 end
end




# validates :name, presence: true
#     validates :phone_number, presence: true
#     validates :adress, presence: true
#     validates :email, presence: true
#     validates :time_line, presence: true
#     validates :note, presence: true
#     validates :created_at, presence: true
#     validates :updated_at, presence: true
private

      def update_whiltelist(params)
           {
                name: params[:name],
                phone_number: params[:phone_number],
                adress: params[:adress],
                email: params[:email],
                time_line: params[:time_line],
                note: params[:note],
                created_at: params[:created_at],
                updated_at: params[:updated_at]
            }
      end


      def find_guest(uniq_id)
        @guest = Guest.find(uniq_id )
     end
    end


