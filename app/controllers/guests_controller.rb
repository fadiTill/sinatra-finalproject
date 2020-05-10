

class GuestsController < ApplicationController

    get "/guests" do
         if logged_in?
        @guests = Guest.all
         @guests = current_user.guests
        erb :"guests/index"
    end
 end


    get "/guests/new" do
        erb :"guests/new"
     end

 post "/guests" do
        @guest = Guest.new(params)
        #@guest = current_user.guests.build(params)
        @user = current_user

    if  @guest.save
        redirect "/guests/#{@guest.id}"
    else 
        erb :"guests/new"
    end
  end

   
 
   get "/guests/:id" do
        @guest = Guest.find(params[:id])
    # find_guest(params[:id])
        erb :"guests/show"
    end



    get "/guests/:id/edit" do
         @guest = Guest.find(params[:id])
        # find_guest(params[:id])
        erb :"guests/edit"
   end

    


    #  patch "/guests/:id/delete" do
    #      @guest = Guest.find(params[:id])
    #     # find_guest(params[:id])
    #     @guest_params = update_whiltelist(params)
    #     @guest.update(@guest_params)
    #      redirect "/guests/#{@guest.id}"
    #  end
    




delete "/guests/:id/" do
 @guest = Guest.find(params[:id])
# find_guest(params[:id])
@guest.destroy
if @guest.errors
    erb :"guests/index"
else
    erb :"guests/#{@guest.id}"
 end
end



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


    #   def find_guest(uniq_id)
    #     @guest = Guest.find(uniq_id )
    #  end
    end


