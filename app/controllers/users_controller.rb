class UsersController < ApplicationController
before_action :authenticate_user!, except: [:index]
# before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.order(created_at: :desc)
   

    # DM用
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      flash[:alert] = 'Your account has successfully deleted./退会しましたご利用ありがとうございました。'
      redirect_to root_path
    end  
  end  

  private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
    # def ensure_correct_user
    #   @user = User.find(params[:id])
    #   unless @user == current_user
    #     redirect_to user_path(current_user)
    #   end
    # end
end
