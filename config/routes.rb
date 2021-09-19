Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :messages do
    resources :messagecommits
  end

  get 'pages/pourquoi'
  get 'pages/admin'
  get 'pages/messages'
  get 'pages/fonctionnement'
  get 'pages/mentions_legales'
  get 'pages/charte'


  get 'refus_message', to: 'messages#refus_message'
  get 'accept_message', to: 'messages#accept_message'
  get 'refus_messagecommit', to: 'messagecommits#refus_messagecommit'
  get 'accept_messagecommit', to: 'messagecommits#accept_messagecommit'


end
