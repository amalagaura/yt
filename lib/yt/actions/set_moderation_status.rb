require 'yt/request'
require 'yt/actions/base'
require 'yt/config'

module Yt
  module Actions
    module SetModerationStatus
      include Insert

    private

      def do_set_moderation_status(moderation_status_params = {})
        expected_response = Net::HTTPNoContent
        response = reject_request({params: moderation_status_params, expected_response: expected_response}).run
        response.is_a? expected_response
      end

      def reject_request(params = {})
        Yt::Request.new(reject_params.deep_merge params).tap do |request|
          print "#{request.as_curl}\n" if Yt.configuration.developing?
        end
      end

      def reject_params
        {}.tap do |params|
          params[:path] = "/youtube/v3/comments/setModerationStatus"
          params[:host] = 'www.googleapis.com'
          params[:method] = :post
          params[:auth] = @auth
          params[:expected_response] = Net::HTTPOK
          params[:api_key] = Yt.configuration.api_key if Yt.configuration.api_key
        end
      end

    end
  end
end