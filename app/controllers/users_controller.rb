class UsersController < ApplicationController

    def new
        render "users/main"
    end


    def show
        @user = User.find( session[:id] )
        # @allPosts = Post.order('users')
        @allPosts = Post.includes(:user_posts).group(:id, 'user_posts.id').order('count(user_posts.id) desc').references(:user_posts)
        p @allPosts
        render "posts/comments"
    end


    def showUser
        @user = User.find( params[:id] )
        # p "user posts are: #{@user.posts.length}"
        # p @user.name
        @likes = UserPost.where(user_id: @user.id).length
        @numPosts = Post.where(user_id: @user.id).length
        render 'users/showUser'
    end


    def create
        @user = User.create( params.permit(:name, :alias, :email, :password, :password_confirmation) )
        p "user.valid is: #{@user.valid?}"
        if @user.valid?
            flash[:notice] = ['Registered Successfully']            
            session[:id] = @user.id
            redirect_to "/main"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end

end
