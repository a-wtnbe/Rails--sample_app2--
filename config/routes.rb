Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # topというURLにgetメゾット（オブジェクトっていう属性操作の操作の方）
  # でリクエストしたときに、homesコントローラーのtopアクションが呼び出される。
  get'top'=>'homes#top'
  # todolistsというURLにpostメゾットでリクエストしたときに、
  # todolistsコントローラーのcreateアクションが呼び出される
  post'todolists'=>'todolists#create'
end
