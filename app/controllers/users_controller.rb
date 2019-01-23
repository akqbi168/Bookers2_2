class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
      # @books = @user.books.page(params[:page]).reverse_order だと逆順 (kaminari)
    @book = Book.new
    # @users = User.all 違うやつ
  end

  def index
    @users = User.all
    @book = Book.new
    # @user = current_user いらない？
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Book has successfully been updated."
      redirect_to user_path(@user) # .idはいらないんじゃないか
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
