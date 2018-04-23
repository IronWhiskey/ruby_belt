class SessionsController < ApplicationController

    # def new
    #     render "sessions/main"
    # end


        # creates a new user session if user successfully logs in
    def create
        p "inside sessions create"
        @user = User.find_by_email(params[:email]).try(:authenticate, params[:password]) 
        if @user != nil and @user != false
            session[:id] = @user.id 
            # p "inside if"
            redirect_to "/bright_ideas"
        else
            # flash[:errors] = @user.errors.full_messages
            flash[:errors] = ['Invalid Combination']
            redirect_to :back
        end
    end



    # Log User out and set session[:user_id] to null
    def destroy
        session[:id] = nil
        redirect_to "/main"
    end

end
