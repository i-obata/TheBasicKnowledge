class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    # １．&２．データを受け取り新規登録するためのインスタンス生成
    @list = List.new(list_params)
    # ３．データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # ４．トップ画面へリダイレクト
      # redirect_to '/top'
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :index
    end
  end
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  private
  # ストロングパラメータ
  def list_params
      params.require(:list).permit(:title, :body, :image)
  end
end
