class SigninController < ApplicationController
    def destroy
        session[:user_id]=nil
        redirect_to root_path
    end
    def new

    end
    def create
        @user = User.find_by(email: params[:email])
        if(@user.present? && @user.authenticate(params[:password]))
         session[:user_id]=@user.id
         redirect_to root_path 
       else
        flash[:alert] = "Sign in Failed"
        redirect_to sign_in_path
       end
    end
end