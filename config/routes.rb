MyStore::Application.routes.draw do
  resources :items do
	get :upvote, on: :member
	get :expensive, on: :collection
  end
  
  match "admin/users_count" => "admin#users_count"
  #match ':controller(/:action(/:id))(.:format)'
end
