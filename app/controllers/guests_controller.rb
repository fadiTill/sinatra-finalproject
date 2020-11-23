

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
        @guests = current_user.guests|| @guests = Guest.all
       
       erb :"guests/index"
    else
    redirect "guests/new"    
 end
end


    get "/guests/:id/edit" do
          find_guest(params[:id])
        if current_user.id == @guest.user_id
           
        erb :"guests/edit"
        else 
            redirect "guests/new"      
   end
end

    


     patch "/guests/:id" do    
         find_guest(params[:id])
         if current_user.id == @guest.user_id
           
        @guest_params = update_whiltelist(params)
        @guest.update(@guest_params)
        # binding.pry
         redirect "/guests/#{@guest.id}"
     
    else 
        redirect "guests/new"      
end
end
    




delete "/guests/:id" do
 find_guest(params[:id])
 if current_user.id == @guest.user_id
  @guest.delete
redirect "guests/new" 
elsif @guest.errors
    redirect to "/"
# else
#     erb :"/guests/#{@guest.id}"
 end
end





# validates :name, presence: true
#     validates :phone_number, presence: true
#     validates :address, presence: true
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
                address: params[:address],
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


