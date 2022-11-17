Rails.application.routes.draw do
  root to: "home#top"
  resources :quizzes, only: [:index, :show, :new, :create] 
  get "/quizzes/:id/answer", to: "quizzes#answer", as: "quiz_answer"
end
