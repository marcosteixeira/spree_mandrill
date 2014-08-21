require 'mandrill'
module SpreeMandrill
  class Wrapper
    attr_accessor :api_key
    def initialize(api_key)
      @api_key = api_key
    end

    def send_email(template_name, template_content, message)
      client.messages.send_template template_name, template_content, message
    end

    private
    def client
      @client ||= ::Mandrill::API.new api_key
    end
  end
end
