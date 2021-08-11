class UsersController < ApplicationController
  
  def index
    @users = User.all
  end  
    
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.order(created_at: :desc)
    # @post = Post.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id) 
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
