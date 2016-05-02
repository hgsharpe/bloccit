class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :authorize_user
  
  def index
    posts = Post.all
    render json: posts.to_json, status: 200
  end
  
  def show
    post = Post.find(params[:id])
    render json: post.to_json(include: :comments), status: 200
  end  
end