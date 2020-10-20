# frozen_string_literal: true

Rails.application.routes.draw do
  resources :urls, only: %i[show create], param: :slug do
    get :stats
  end
end
