EresElCambio::Application.routes.draw do
  root to: 'home#home'
  mount Resque::Server, :at => "/resque"

  match 'counties/:county', to: 'counties#search_for_county'
end
