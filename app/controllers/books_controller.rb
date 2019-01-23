class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

    def home
    end

    def about
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "Book has successfully been created."
            redirect_to book_path(@book.id)
                # redirect_to @book, notice: "ここにメッセージ" でもOK!
        else
            @books = Book.all
            render 'index'
                # render :new　　　ではない！
        end
    end

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
        # kaminariを導入して、以下のようにすれば、リバースオーダーにもなる（逆順）
        # @books = Book.page(params[:page]).reverse_order
    end

    def show
        @book = Book.find(params[:id])
        @bookn = Book.new
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user_id != current_user.id
            redirect_to book_path(@book)
        end
        # @user = User.find(params[:id]) 不要
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "Book has successfully been updated."
            redirect_to book_path # @book
        else
            render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "Book has successfully been destroyed."
        redirect_to books_path
        # redirect_to books_path, notice: "Book has successfully been destroyed." => 上の2行は左記でもOK
    end

    private
        def book_params
            params.require(:book).permit(:title, :introduction, :body)
        end

        # def correct_user
        #     book = Book.find(params[:id])
        #     if current_user != @user
        #     redirect_to user_path
        # end

end