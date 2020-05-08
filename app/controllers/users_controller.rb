class UsersController < ApplicationController



    get "/users/:id" do
        @user = User.find(params[:id])
        erb :"users/show"

end

get "/signup" do
    erb:"users/new"
end 




post "/users/signup" do
    user =User.new(paramas)
    if user.save && params[:password].lenght > 6
        session[:user_id] = @user.id
 redirect "/guests"
    else
        erb :"guests/new"
  end
end


delete "/logout" do 
    if session.destroy
        redirect "/"
    else
        redirect "/guests"
end 
end


    delete "/users/deactivate" do 
    end
end