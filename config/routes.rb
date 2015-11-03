Rails.application.routes.draw do
  get "/"               => "sites#home"
  get "/contact"        => "sites#contact"
  get "/projects"       => "projects#index"
  post "projects"       => "projects#create"
  get "/projects/new"   => "projects#new"
  get "/projects/:id"   => "projects#show"

end
