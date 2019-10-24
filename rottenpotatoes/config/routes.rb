Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  # (HINT: use the 'match' syntax for routes as suggested in "Non-Resource-Based Routes" in Section 4.1 of ESaaS)
  match '/movies/:id/similar', to: 'movies#similar', as: 'movie_similar', via: :get
end
