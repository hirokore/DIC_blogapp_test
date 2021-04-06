class BlogsController < ApplicationController
  before_action :set_blog,only: [:show, :edit, :update, :destroy]
  def new
    @blog = Blog.new
  end

  def index
    @blogs =Blog.all
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログが編集されました。"
    else
      render :edit
    end
  end

  def create
    @blog = Blog.create(blog_params)
    if params[:back]
      @blog = Blog.new(blog_params)
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice:"ブログが投稿されました。"
      else
        render :new
      end
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:content)    
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
