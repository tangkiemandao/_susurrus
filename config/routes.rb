Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # get 'home/index'
  root 'home#index'
  controller :home do
    get 'send_mail', action: :send_mail
  end
end
