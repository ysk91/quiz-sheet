Rails.application.routes.draw do
  root to: "home#top"
  resources :quizzes
end
