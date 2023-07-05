class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    # １．&２．データを受け取り新規登録するためのインスタンス生成
    list = List.new(list_params)
    # ３．データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ４．トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  def index
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
      params.require(:list).permit(:title, :body)
  end
end
