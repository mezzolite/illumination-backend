Rails.application.routes.draw do
  resources :adjectives
  resources :verbs
  resources :nouns
  resources :words
  resources :ideas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
