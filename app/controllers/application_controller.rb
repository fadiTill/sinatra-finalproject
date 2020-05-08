require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do 
     def looged_in?
      !!session[:user_id]
  end


  def current_user
    @user||== User.find(session[:user_id]) if session [:user_id]
  end
  

  
  # post "/" do 
  #   @guest = Guest.new(name:"name 1")
  #   if @guest.save
  #     erb: new_welcome
    #else
      #do something upon failure 

 
  # get '/images/home-realestate-106399.jpg' do
  #   "/images/home-realestate-106399.jpg"
  # end
end


