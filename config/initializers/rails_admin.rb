RailsAdmin.config do |config|
  #config.authorize_with :pundit
  config.authenticate_with do
    # Use sorcery's before filter to auth users
    require_login
end
  config.current_user_method(&:current_user)
  #redirect_to root_path unless current_user.admin?

  ## == Pundit ==
  # config.authorize_with :pundit

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
