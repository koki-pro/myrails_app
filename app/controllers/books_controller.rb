class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "投稿に成功しました！！"
    else
      render :new
    end
  end
  

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  
end
