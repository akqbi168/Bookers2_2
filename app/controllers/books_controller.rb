class BooksController < ApplicationController

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
            redirect_to books_path
        else
            render :new
        end
    end

    def index
        @user = current_user
        @books = Book.page(params[:page]).reverse_order
        @book = Book.new
    end

    def show
        @user = User.find(params[:id])
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private
        def book_params
            params.require(:book).permit(:title, :introduction, :body)
        end

end