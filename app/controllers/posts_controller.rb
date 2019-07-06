class PostsController < ApplicationController

    def index
        if params[:user_posts] == "true"
            @posts = Post.where(user_id: current_user.id).order("created_at DESC")
          else
            @posts = Post.all.order("created_at DESC")
          end
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id if current_user
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def edit
    
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end

end