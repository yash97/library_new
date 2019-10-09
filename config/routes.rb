Rails.application.routes.draw do
  get 'home_page/index'
  devise_for :librarians , controllers:{sessions: 'librarians/sessions', registrations: 'librarians/registrations'}
  devise_for :students, controllers:{sessions: 'students/sessions',registrations: 'students/registrations'}
  devise_for :admins , controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}
  resources :admins
  resources :librarians
  resources :students
  #resources :bookmarks
  resources :book_histories
  resources :libraries
  get '/getBookmarkBooks' => 'books#getBookmarkBooks', :as => 'getBookmarkBooks'
  get '/getStudentBookFine' => 'books#getStudentBookFine', :as => 'getStudentBookFine'
  get '/getOverDueBooks' => 'books#getOverDueBooks', :as => 'getOverDueBooks'
  get '/viewBookHistory' => 'books#viewBookHistory', :as => 'viewBookHistory'
  get '/viewHoldRequest' => 'books#viewHoldRequest', :as => 'viewHoldRequest'
  root to: 'home_page#index'
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
