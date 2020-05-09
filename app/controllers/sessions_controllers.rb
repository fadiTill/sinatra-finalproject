class SessionsController < ApplicationController

    get "/login" do 
 if logged_in?
  erb :"users/login"
 end
end


 post "/login" do
    @user = user.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        redirect "/guests"

    else 
        erb :"users/login"
    end
  end
end