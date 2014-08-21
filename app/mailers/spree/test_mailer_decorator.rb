module Spree
  TestMailer.class_eval do
    alias_method :original_test_email, :test_email

    def test_email(user)
      original_test_email(user) unless Spree::Config[:enable_mandrill_delivery]

      recipient = user.respond_to?(:id) ? user : Spree.user_class.find(user)
      template_name = Spree::Config[:test_email_template]
      message = {
        to: [{email: recipient.email}]
      }
      SpreeMandrill::Wrapper.new(Spree::Config[:mandrill_api_key]).send_email(template_name, [], message)
    end
  end
end
