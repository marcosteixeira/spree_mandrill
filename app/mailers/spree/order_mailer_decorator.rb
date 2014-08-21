module Spree
  OrderMailer.class_eval do
    alias_method :original_confirm_email, :confirm_email
    alias_method :original_cancel_email, :cancel_email

    def confirm_email(order, resend=false)
      return original_confirm_email(order, resend) unless Spree::Config[:enable_mandrill_delivery]

      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      template_name = Spree::Config[:order_confirm_email_template]
      message = {
        to: [{email: @order.email}]
      }

      SpreeMandrill::Wrapper.new(Spree::Config[:mandrill_api_key]).send_email(template_name, [], message)
    end

    def cancel_email(order, resend=false)
      return original_cancel_email(order, resend) unless Spree::Config[:enable_mandrill_delivery]

      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      template_name = Spree::Config[:order_cancel_email_template]
      message = {
        to: [{email: @order.email}]
      }

      SpreeMandrill::Wrapper.new(Spree::Config[:mandrill_api_key]).send_email(template_name, [], message)
    end
  end
end
