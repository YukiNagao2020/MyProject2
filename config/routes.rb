Rails.application.routes.draw do
  
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end  

  get 'posts/category/1', to: 'posts#category1', as: 'category1'
  get 'posts/category/2', to: 'posts#category2', as: 'category2'
  get 'posts/category/3', to: 'posts#category3', as: 'category3'
  get 'posts/category/4', to: 'posts#category4', as: 'category4'
  get 'posts/category/5', to: 'posts#category5', as: 'category5'
  get 'posts/category/6', to: 'posts#category6', as: 'category6'
  get 'posts/category/7', to: 'posts#category7', as: 'category7'
  get 'posts/category/8', to: 'posts#category8', as: 'category8'
  get 'posts/category/9', to: 'posts#category9', as: 'category9'
  get 'posts/category/10', to: 'posts#category10', as: 'category10'
  get 'posts/category/11', to: 'posts#category11', as: 'category11'
  get 'posts/category/12', to: 'posts#category12', as: 'category12'
  get 'posts/category/13', to: 'posts#category13', as: 'category13'
  get 'posts/category/14', to: 'posts#category14', as: 'category14'
  get 'posts/category/15', to: 'posts#category15', as: 'category15'
  get 'posts/category/16', to: 'posts#category16', as: 'category16'
  get 'posts/category/17', to: 'posts#category17', as: 'category17'
  get 'posts/category/:id', to: 'posts#category', as: 'category'
end
