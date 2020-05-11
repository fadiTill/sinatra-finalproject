class UsersController < ApplicationController


            get "/users/:id" do
            if logged_in?
                @user = User.find(params[:id])
                erb :"users/show"
            end
            end
        

            
            
            
            post "/signup" do
                @user = User.new(params)
                #do other stuff then save
            if @user.save && params[:password].length > 6
                session[:user_id] = @user.id
                redirect "/login"
            #   redirect "/guests/new"  
            else
                erb :"users/new"
            end
            end

            
            
            
            get "/signup" do
                if logged_in?
                    redirect "/guests/index"
                else
                erb :"users/new"
            end 
            end

            get '/login' do 
                @error_message = params[:error]
                if !session[:user_id]
                  erb :'users/login'
                else
                  redirect '/guests/new'
                end
              end
            
              post '/login' do
                user = User.find_by(:name => params[:name])
                if user && user.authenticate(params[:password])
                  session[:user_id] = user.id
                  redirect "/guests/new"
                else
                  redirect to '/signup'
                end
              end

  

            get "/users/:id" do
                if logged_in?
                 @user = User.find(params[:id])
                 erb :"users/show"
               end
            end


            delete "/logout" do 
                if logged_in?
                session.clear
                redirect "/"
                else
                    redirect "/guests"
                 end 
                # else redirect "/guests"
            end


            # delete "/users/deactivate" do 
            # end
            end