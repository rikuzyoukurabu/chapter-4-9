class BooksController < ApplicationController

  def index
    @books = Book.all
    # データを全部取ってくる
    @book = Book.new
    # 2ページ目に表示させるからnewではない　たぶん
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = "Book was successfully update."
    redirect_to book_path(@book.id)
     else
       render :edit
     end
  end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:notice] = "Book was successfully delete."
      redirect_to index_book_path
    else
     render action: :edit
    end
  end

  def create
    # データを投稿する為のインスタンス作成
    @book = Book.new(book_params)
    # データを保存するためのsaveメゾットの実行
    if @book.save
    # 2ページ目にリダイレクト
     flash[:notice] = "Book was successfully update."
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render action: :index
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
