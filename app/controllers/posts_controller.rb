class PostsController < ApplicationController
  
    before_action :set_post_id, only: [:show, :edit, :update, :destroy]

    def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "スケジュールを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.order(created_at: :desc)
    @counts = Post.count
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新しました", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "スケジュールを削除しました"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_post_id
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body ,:start_date, :end_date, :all_day)
  end  
end
