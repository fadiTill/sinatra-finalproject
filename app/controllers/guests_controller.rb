

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
        erb  :"guests/show"
    else 

        erb :"guests/new"
end
end

   
 
 get "/guests/:id" do
     @guest = Guest.find(params[:id])
        erb :"guests/show"
    end
end


#    get "/guests/:id/edit" do
# @guest = guest.find(params(:id))
# erb:"guest/edit"
        
#     end


#     patch "movies/:id" do
# end
    




# delete "guests/:id/delete"do
# end







