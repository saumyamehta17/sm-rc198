SmRc198::Application.routes.draw do
  resources :posts do
    get 'edit_multiple', on: :collection
    put 'update_multiple', on: :collection
    put 'update_individual', on: :collection
    get 'edit_individual', on: :collection
  end
  #For collection custom action
  #get 'posts/edit_multiple', to: 'posts#edit_multiple', as: :edit_multiple_posts
  #put 'posts/update_multiple'
  root 'posts#index'
end
