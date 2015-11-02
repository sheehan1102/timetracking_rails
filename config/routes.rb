Rails.application.routes.draw do
  get "/"       => "sites#home"
  get "/about"  => "sites#about"
end
