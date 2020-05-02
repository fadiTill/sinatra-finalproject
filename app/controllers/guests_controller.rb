

class GuestsController < ApplicationController

    
    get "/guests/index" do
      erb :"guests/index"
end

get "/guests/new" do
    erb :"guests/new"
 end

 post "/guests" do
    @guest = Guest.new(params)
    if @guest.save
        erb :"guests/show"

    else   
        erb :"guests/new"
   end
end


 get "/guests/:id" do
    @guest = Guest.find(params[:id])
    erb :"guests/show"
 end


#  post"guests/" 
# end
 
# get "/guests/:id" do
    
#     erb :"guests/show"
#  end

#  get "/guests/:id/edit" do
    
    
#  end

#  patch "/"guests/:id
# end


# # get "/guests/:id/delete" do
# # end


# delete "/guests/:id/delete"
# end

end
