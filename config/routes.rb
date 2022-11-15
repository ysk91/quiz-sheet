Rails.application.routes.draw do
  root to: "home#top"
  resources :quizzes, only: [:index, :show, :new, :create] 
end
