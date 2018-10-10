Rails.application.routes.draw do
  devise_for :users, only: [:sessions]
  ActiveAdmin.routes(self)
  # get 'home/index'
  root 'home#index'
  controller :home do
    get 'send_mail', action: :send_mail
    get 'photos(/page/:page)', action: :photo
  end
end
