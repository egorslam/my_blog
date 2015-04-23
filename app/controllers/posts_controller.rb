class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all.order('created_at DESC').page(params[:page]).per(5)
	end

	
	def create 
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.create(post_params)

		redirect_to blog_path(@blog)
	end


	def destroy
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.find(params[:id])
		@post.destroy

		redirect_to blog_path(@blog)
	end

private 
	def post_params
		params.require(:post).permit(:title, :body)	#передача требуемых парметров методам выше 
	end
end