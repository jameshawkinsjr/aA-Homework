Rails.application.routes.draw do

  resources :cats do
    # /cats/:cat_id/toys/:id
    # keep only the ones that don't reference a *specific* toy, otherwise the path is redundant
    resources :toys, only: [:index, :new]
  end
  # keep the ones that reference a specific toy, to keep path cleaner
  # /toys/:id
  resources :toys, only: [:create, :show, :update, :destroy]

  root to: redirect("/cats")
end
