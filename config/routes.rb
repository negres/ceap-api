Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  if Rails.env.development?
    require 'sidekiq/web'

    Sidekiq::Web.use ActionDispatch::Cookies
    Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

    mount Sidekiq::Web => '/sidekiq'
  end

  defaults format: :json do
    resources :deputies, only: %i[show index] do
      member do
        get 'expenses', action: 'expenses'
      end
    end

    # resources :import_file, only: [] do
    #   collection do
    #     post 'import_file', action: 'import_file'
    #   end
    # end

    post 'import_file'=> 'import_file'


  end

    # get 'vaquinha/:id' => 'vakinhas#show', as: :vaquinha
end
