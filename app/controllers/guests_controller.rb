class GuestsController < ApplicationController

    get "/guests" do
        erb :"guests/index"
end
end