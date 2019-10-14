class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報編集しました。'
        redirect_to user_path(params[:id])
      else
        flash.now[:failed] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
    else
      flash[:again] = 'idが一致しません。'
      redirect_to :new
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile, :image_cache, :email, :password,
                                    :password_confirmation)  end
end
