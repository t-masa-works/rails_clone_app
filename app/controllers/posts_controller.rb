class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    return render:new if params[:back]
    return redirect_to posts_path, notice: "呟きを保存しました！" if @post.save
    return render:new
  end

  def edit
  end

  def update
    return redirect_to posts_path, notice: "呟きを編集しました！" if @post.update(post_params)
    render:new
  end

  def confirm
    @post = Post.new(post_params)
    render:new if @post.invalid?

  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "ブログを削除しました"
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
