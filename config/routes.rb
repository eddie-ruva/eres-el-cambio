EresElCambio::Application.routes.draw do
  root to: 'home#home'

  match 'counties/show_by_term', to: "counties#show_by_term"

  resources :counties do
    get 'search_on_name', :on => :collection
  end

  mount Resque::Server, :at => "/resque"
end
