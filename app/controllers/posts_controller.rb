class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    # if params[:category_id]
    #   @category = Category.find(params[:category_id])
    #   @posts = @category.posts.page(params[:page]).reverse_order.order(created_at: :desc)
    # else
      @posts = Post.page(params[:page]).reverse_order.order(created_at: :desc)
  #     p @posts
  #   end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

 
  def category1
    @category = Category.find(1)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
    # @posting = Post.find(params[:id])
  end  
  
  def category2
    @category = Category.find(2)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end 
  
  def category3
    @category = Category.find(3)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  
  def category4
    @category = Category.find(4)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  
  def category5
    @category = Category.find(5)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category6
    @category = Category.find(6)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category7
    @category = Category.find(7)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category8
    @category = Category.find(8)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category9
    @category = Category.find(9)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category10
    @category = Category.find(10)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category11
    @category = Category.find(11)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category12
    @category = Category.find(12)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category13
    @category = Category.find(13)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category14
    @category = Category.find(14)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category15
    @category = Category.find(15)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category16
    @category = Category.find(16)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  def category17
    @category = Category.find(17)
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  
  def category
    @category = Category.find(params[:id])
    @post = Post.includes(:categories).where(post_category_relations: { category_id: @category }).page(params[:page]).reverse_order.order(created_at: :desc)
  end
  
   private

  def post_params
    params.require(:post).permit(:title, :body, :image, category_ids: [])
  end
end
