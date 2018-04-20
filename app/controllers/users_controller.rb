class UsersController < ApplicationController

    def new
        render "users/main"
    end

    def show
        @user = User.find( session[:id] )
        @allPosts = Post.all()

        # @orderedPosts = []
        # while allPosts.length > 0
        #     mostLikedPost = allPosts[0]       # setting the post with most likes as the first one
        #     allPosts.each do |post|
        #         p post.users.length
        #         if post.users.length > mostLikedPost.users.length
        #             mostLikedPost = post
        #         end
        #     end
        #     @orderedPosts.push(mostLikedPost)
        #     allPosts.delete(mostLikedPost)
        # end
        render "posts/comments"
    end


    def showUser
        @user = User.find( session[:id] )
        p @user.name
        @likes = 0

        @user.posts.each do |post|
            @likes += posts.users.length
            p @likes
        end
        render 'users/showUser'
    end

    def create
        @user = User.create( params.permit(:name, :alias, :email, :password, :password_confirmation) )
        p "user.valid is: #{@user.valid?}"
        if @user.valid?
            session[:id] = @user.id
            redirect_to "/main"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end

    end


end
