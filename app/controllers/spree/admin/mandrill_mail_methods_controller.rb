module Spree
  module Admin
    class MandrillMailMethodsController < Spree::Admin::BaseController
      def update
        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:mandrill_mail_methods))
        redirect_to edit_admin_mandrill_mail_method_url
      end

      def testmail
        if TestMailer.test_email(try_spree_current_user.id)
          flash[:success] = Spree.t('admin.mandrill_mail_methods.testmail.delivery_success')
        else
          flash[:error] = Spree.t('admin.mandrill_mail_methods.testmail.delivery_error')
        end
      rescue Exception => e
        flash[:error] = Spree.t('admin.mandrill_mail_methods.testmail.error') % {:e => e}
      ensure
        redirect_to edit_admin_mandrill_mail_method_url
      end
    end
  end
end
