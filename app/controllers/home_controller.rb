class HomeController < ApplicationController
    def index
        @demo=User.find_by(id: session[:user_id])
    end
end