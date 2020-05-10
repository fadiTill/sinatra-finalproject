class UsersController < ApplicationController


    get "/users/:id" do
        if logged_in?
        @user = User.find(params[:id])
    erb :"/users/show"
    end
    end
   


get "/signup" do
     if logged_in?
         redirect "/guests/index"
     else
    erb :"/users/new"
end 
end


   post "/signup" do
    @user = User.new(params)
    #do other stuff then save
    if @user.save && params[:password].length > 6
     session[:user_id] = @user.id
     
     redirect "users/login"
    #  redirect "/guests/new"
    
    else
        erb :"/users/new"
  end
end

get "/users/:id" do
    if logged_in?
    @user = User.find(params[:id])
erb :"/users/show"
end
end


delete "/logout" do 
    #  if logged_in?
    if session.clear
        redirect "/"
    else
        redirect "/guests"
end 
# else redirect "/guests"
end


    # delete "/users/deactivate" do 
    # end
end