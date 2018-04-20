class PostsController < ApplicationController


    def edit        # adds a new user to the UserPost join table when a post is liked
        user = User.find( session[:id] )
        postsFromUser = UserPost.where(user_id: user.id)
        found = false
        postsFromUser.each  do |record|
            if record.post_id == params[:post_id]
                found = true
                # redirect_to :back
            end
        end
        if found
            redirect_to :back
        else
            like = UserPost.create(user_id: user.id, post_id: params[:post_id])
            redirect_to :back
        end
    end

    def show
        post = Post.find( params[:post_id] )
        render "posts/show"
    end

    def create
        # user = User.find( session[:id] )
        p = Post.create( params.permit(:idea, :user_id))
        redirect_to :back
    end

end
