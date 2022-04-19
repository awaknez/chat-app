Rails.application.routes.draw do

  devise_for :users
  root to: "rooms#index" #ルームコントローラのindexアクションに設定。
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create] #ネストによりroomsが親でmessageが子という関係を作り、メッセージに紐づくルームのidの情報を含んだパスを受け取れる。
  end
end
