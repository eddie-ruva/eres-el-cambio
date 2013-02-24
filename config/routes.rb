EresElCambio::Application.routes.draw do
  root to: 'home#home'

  resources :counties do
    get 'search_on_name', :on => :collection
  end

  mount Resque::Server, :at => "/resque"
end
