

class GuestsController < ApplicationController

    get "/guests" do
        erb :"guests/index"
    end


    get "/guests/new" do
        erb :"guests/new"
     end

 post "/guests" do
    @guest = Guest.new(params)
    if @guest.save
        redirect "guests/#{@guest.id}"
    else 

        erb :"guests/new"
end
end

   
 
 get "/guests/:id" do
     @guest = Guest.find(params[:id])
        erb :"guests/show"
    end



    get "/guests/:id/edit" do
 @guest = Guest.find(params[:id])
     erb :"guests/edit"
     end

    


     patch "guests/:id" do
        @guest = Guest.find(params[:id])
         @guest_params = update_whiltelist(params)
        @guest.update(@movie_params)
         redirect "guests/#{@guest.id}"
 end
    




# delete "guests/:id/delete"do
# end


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
end


