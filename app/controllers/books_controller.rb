class BooksController < ApplicationController


  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @bookn = Book.new #空のフォーム
    @post_comment = PostComment.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @post_comment = PostComment.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      @user = current_user
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      @user = @book.user
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(id: current_user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
