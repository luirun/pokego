Rails.application.routes.draw do
  resources :comments
  mount Ckeditor::Engine => '/ckeditor'
root to: 'visitors#new'
get 'download' => 'visitors#download'
get 'items' => 'visitors#items'
get 'dolacz' => 'visitors#invite'
get 'faq' => 'visitors#faq'
get 'technical-faq' => 'visitors#technicalfaq'
get 'admins/panel' => 'admins#panel'
get 'admins/new' => 'admins#new'
post 'admins/create' => 'admins#create'
get 'admins/useredit' => 'admins#useredit'
get 'calendars/index' => 'calendars#index'
post 'calendars/create' => 'calendars#create'
get 'calendars/new' => 'calendars#new'
get 'calendars/describe' => 'calendars#describe'
get 'zastepy' => 'units#index'
get 'units/create' => 'units#create'
post 'units/new' => 'units#new'
get 'sessions/new' => 'sessions#new'
post 'sessions/create' => 'sessions#create'
get 'sessions/logout' => 'sessions#destroy'
post 'users/create' => 'users#create'
get 'users/profile' => 'users#profile'
get 'users/new' => 'users#new'
get 'profil/edytuj' => 'users#edit'
patch 'profil/edytowany' => 'users#update'
get 'autor' => 'users#author'
get 'posts/new' => 'posts#new'
post 'posts/create' => 'posts#create'
get '/post' => 'posts#show'
get '/post/edytuj' => 'posts#update'
post '/post/zedytowany' => 'posts#updated'
get 'posts/last2' => 'posts#last2'
get 'posts/kategoria' => 'posts#newcategory'
post '/post/dodanokategorie' => 'posts#categoryadded'
get 'posts/in' => 'posts#showcategory'
get 'galeria' => 'photos#show'
get 'galeria/dodaj' => 'photos#new'
get 'galeria/nowa' => 'photos#newgallery'
post 'galeria/dodano' => 'photos#create'
post 'galeria/dodanogalerie' => 'photos#creategallery'
get 'zdjecia/' => 'photos#showgallery'
get 'zdjecie/nowe' => 'photos#newingallery'
get 'zdjecie/nowe/dodaj' => 'photos#createingallery'
get 'kontakt' => 'contacts#index'
post 'kontakt/wyslij' => 'contacts#create'
get 'kadra' => 'scouts#show'
get 'approve' => 'comments#approve'


resources :visitors do
  resources :posts
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
