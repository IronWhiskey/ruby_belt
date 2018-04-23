class PostsController < ApplicationController


    def edit    # adds a new user to the UserPost join table when a post is liked
        user = User.find( session[:id] )
        postsFromUser = UserPost.where(user_id: user.id)
        # p "session id is #{session[:id]}"
        # p "posts from  this user are #{postsFromUser}"

        post = Post.find(params[:post_id])
        unless post.users.include? user
            if post.user != user
                UserPost.create(user_id: user.id, post_id: params[:post_id])
            end
        end

        redirect_to :back
    end

    def show
        @post = Post.find( params[:id] )
        render "posts/show"
    end

    def create
        p = Post.create( params.permit(:idea, :user_id))
        redirect_to :back
    end

end
