class GuestsController < ApplicationController

    get "/guests/id" do
        erb :"guests/index"
end
    get "/guests/index" do
        erb :"guests/index"
end
end