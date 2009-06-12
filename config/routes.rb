ActionController::Routing::Routes.draw do |map|
  map.resources :contractors

  map.resources :projects

  map.resources :clients

  map.resources :entries
  
  map.invoices '/invoices/:id.:format', :controller => 'invoices', :action => 'show'
  
  map.connect '/', :controller => 'entries', :action => 'index'
end
