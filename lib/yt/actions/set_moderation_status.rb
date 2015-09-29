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
        response = insert_request({params: moderation_status_params, expected_response: expected_response}).run
        response.is_a? expected_response
      end

      def insert_path
        "/youtube/v3/comments/setModerationStatus"
      end

    end
  end
end