Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # topというURLにgetメゾット（オブジェクトっていう属性操作の操作の方）
  # でリクエストしたときに、homesコントローラーのtopアクションが呼び出される。
  get'top'=>'homes#top'
  # todolistsというURLにpostメゾットでリクエストしたときに、
  # todolistsコントローラーのcreateアクションが呼び出される
  post'todolists'=>'todolists#create'
  get'todolists'=>'todolists#index'
  # どのデータを表示するか判別するためにidもURLに含める
  # as:'名前'は、名前付きルートURLをわかりやすくするために使用
  # 　'todolists#show'の設定を'todolist'として利用できるって意味
  get'todolists/:id'=>'todolists#show',as:'todolist'
end
