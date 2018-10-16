# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider(
  #   :auth0,
  #   'ObQqZ8cA6qe17h936NJW4B6nfFWjYRhU',
  #   'GMAMBBc5t_UgS3AnjS_ZIAuKvO6cctQowKGa8emyQT3P-JqnXwBjn3B6Kr2yQq3F',
  #   'al-un-dev.eu.auth0.com',
  #   callback_path: '/auth/oauth2/callback',
  #   authorize_params: {
  #     scope: 'openid profile'
  #   }
  # )
  provider(
    :auth0,
    ENV['AUTH0_CLIENT_ID'],
    ENV['AUTH0_CLIENT_SECRET'],
    ENV['AUTH0_DOMAIN'],
    callback_path: ENV['AUTH0_CALLBACK'],
    authorize_params: {
      scope: 'openid profile'
    }
  )
end
