module Spree
  AppConfiguration.class_eval do
    preference :enable_mandrill_delivery, :boolean, :default => false
    preference :mandrill_api_key, :string
    preference :order_confirm_email_template, :string, :default => 'order-confirm-template'
    preference :order_cancel_email_template, :string, :default => 'order-cancel-template'
    preference :shipped_email_template, :string, :default => 'shipped-template'
    preference :test_email_template, :string, :default => 'test-template'
  end
end
