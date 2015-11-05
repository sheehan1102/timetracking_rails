Rails.application.routes.draw do
	get "/"	=> "sites#home"

	resources :projects do
		resources :entries, only: [:index, :new, :create]
	end

	resources :entries, only: [:edit, :update, :destroy]
end
