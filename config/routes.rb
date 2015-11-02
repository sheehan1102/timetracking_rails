Rails.application.routes.draw do
  get "/"               => "sites#home"
  get "/contact"        => "sites#contact"
  get "/projects"       => "projects#index"
  get "/projects/:id"   => "projects#show" # params[:id]
end
