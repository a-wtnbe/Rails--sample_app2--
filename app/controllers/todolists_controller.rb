class TodolistsController < ApplicationController
  def new
    # ＠のついたインスタンス変数はviewsファイルへの受け渡しができる
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス（実機）作成
      # listインスタンスでは。Listメゾットでnewが呼び出され、
      # 引数でlist_paramsが呼び出されている
      # ＠のついていないローカル変数はviewsファイルへの受け渡しができない
        # アクション内でしか利用できない。（今回viewsへ引き渡さないから＠不要）
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメゾット（操作）実行
    list.save
    #データベース保存後、 show画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    # このインスタンス変数（＠lists）は複数のデータが入ってるから複数形
    @lists = List.all
  end

  def show
    # 1件のレコードを取得するため、インスタンス変数は単数形
    # 特定のデータ1つは、モデル名.find(params[:id])で取得
    # 　findメゾットは1つのレコードを取ってくる指示
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  private
    # ここから下はcontrollerの中でしか呼び出せません
    # さらに、アクションとして認識されなくなります！
    # privateのメゾット名は「モデル名_params」とすることが多い

  # ストロングパラメータ
    # マスアサインメント微弱性（データ送信時に不正リクエストによって予期せぬ値に変更されてしまう微弱性）を防ぐ

  # list_paremsの定義
    # paramsはRailsで送られてきた値を受け取るためのメゾット（操作）
    # requireでデータのオブジェクト名（:list）を指定し、
    # permitキーで（:title,:body）を指定している。
    # これにより、list_paramsの中にフォームで入力されたデータが格納される
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
