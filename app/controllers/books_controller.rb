class BooksController < ApplicationController
  

  def index
  @books = Book.all
  @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy  # データ（レコード）を削除
    redirect_to books_path # 投稿一覧画面へリダイレクト
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :'books/index'
    end
  end
  
  
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :'books/edit'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
