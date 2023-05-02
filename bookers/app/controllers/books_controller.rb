class BooksController < ApplicationController
  #データフォーム表示

  #データ保存機能
  def create
    @book = Book.new(book_params)
    if  @book.save #データベースに保存する
    redirect_to books_path #indexページにリダイレクト
    flash[:notice] = "Book was successfully created." #サクセスメッセージ
    else #エラーメッセージ
    @books = Book.all
      render :index
    end
  end

#一覧表示機能
  def index
    @books = Book.all#allは、Bookモデルがやりとりしているデータベースのテーブルに保存されている、すべてのレコードをまとめて取得する。
    @book = Book.new
  end

#詳細画面
  def show
    @book = Book.find(params[:id])
  end

#編集機能
  def edit
    @book = Book.find(params[:id])#投稿済みのデータを編集するため、findメソッドを使って、保存されているデータを取得する.
  end

  #更新機能
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "Book was successfully update." #サクセスメッセージ
  end

  #削除機能
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroy." #サクセスメッセージ
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end