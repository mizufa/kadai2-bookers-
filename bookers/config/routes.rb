Rails.application.routes.draw do
  resources :books
  root to: 'homes#top'#top画面を「/」（https://...amazonaws.com/ ）で表示
  get 'top' => 'homes#top'#トップ画面
  
  patch 'books/:id/edit' => 'books#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
