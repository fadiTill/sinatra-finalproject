class UsersController < ApplicationController



    get "/users/:id" do
        @user = User.find(params[:id])
        erb :"users/show"
end

get "/signup" do
    erb:"users/new"
end 




   post "/signup" do
    @user = User.new(params)
    #do other stuff then save
    if @user.save && params[:password].length > 6
     session[:user_id] = @user.id
    redirect "/guests"
    else
        erb :"users/new"
  end
end


delete "/logout" do 
    if session.clear
        redirect "/"
    else
        redirect "/guests"
end 
end


    delete "/users/deactivate" do 
    end
end