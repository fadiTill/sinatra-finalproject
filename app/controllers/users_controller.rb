class UsersController < ApplicationController




  # t.string  :name
  # t.string  :email
  # t.string  :password_digest

          
        
           
           
           
            get '/signup' do
              erb :"users/new"
          end 
          
            
            
            
            post '/signup' do

              # Homework  validator to protect against duplicate login credentials across different users,
              #   usually username or email)
              user = User.find_by(:email => params[:email])
              if user && user.authenticate(params[:password])
                 session[:user_id] = user.id
                redirect "/guests/new"
               else
              # if user exict redirect to guest/new and can access guest already create
               #else redirect to new user welcome page.
                @user = User.create(
                  name: params[:name],
                  email: params[:email],
                  password: params[:password])
                session[:user_id] = @user.id
                redirect "/users/#{@user.id}"
          end
        end





            get '/users/:id' do
              if logged_in?
                   @user = User.find(params[:id])
                  erb :"/users/show"
              else 
                redirect "/"
              end
               end
            
            
           




            
            get '/login' do 
                # @error_message = params[:error]
                # if !session[:user_id]
                  erb :'users/login'
                # else
                #   redirect '/guest/new'
                # end
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


            get "/logout" do #delete
                if logged_in?
                session.clear
                redirect "/"
                else
                    redirect "/guests"
                 end
               end


           
            end