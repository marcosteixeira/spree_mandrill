Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :mandrill_mail_method, :only => [:edit, :update] do
      post :testmail, :on => :collection
    end
  end
end
