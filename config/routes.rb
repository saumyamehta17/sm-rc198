SmRc198::Application.routes.draw do

#Railscast 203 started
#    can use get alone or put ,  match will be for collection of http verbs
    #match "post" => "posts#index" ,  via: [:get, :post], as: :lin
    #without format it vl give error eg localhost:3000/post.pdf
    #  match "post.format" => "posts#index" ,  via: [:get, :post], as: :lin
    #format will be optional
      match "/post(.:format)" => "posts#index" ,  via: [:get, :post], as: :sample   #now u can refer as redirect_to sample_url or sample_path (as: functionality)
      #  : is used for dynamic value and () is used for optional and can be nested
      #match ":year(/:month(/:day))" => "posts#about" ,  via: [:get, :post]
      #As above route is very generic it will accept 1998 or sweety as year , but make it acceptable for 19998 use
      match ":year(/:month(/:day))" => "posts#about" ,  via: [:get, :post] , constraints: {year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
      #constarint specfic to user agent
      #match "secret" => "posts#secret", constraints: { host: /localhost/ } ,  via: [:get, :post]
      #If dont wat to create controller action and temlate use rack
       match "/hello" => proc { |env| [200, {}, ["Welcome"]] }, via: [:get,:post]
#end of 203

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
