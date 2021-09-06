Rails.application.routes.draw do
  root :to => 'homes#top'
  # TOPページに/を移すやつ
  get 'books' => 'books#index', as:'index_book'
  # リンクから次にどこに飛ぶのかを指定する。ここではindex
  get 'books/:id' => 'books#show', as:'book'

  get 'books/:id/edit' => 'books#edit', as:'edit_book'
  # edit用のルーティング

  patch 'books/:id' => 'books#update', as:'update_books'
  # これは編集したやつをアップデートするルーティング

  delete 'books/:id' => 'books#destroy', as:'destroy_book'
  # deleteアクション用ルーティング

  post 'books' => 'books#create'
  # クリエイトアクションをする

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
