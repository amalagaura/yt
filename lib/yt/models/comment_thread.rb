require 'yt/models/resource'

module Yt
  module Models
    # Provides methods to interact with a YouTube commentThread.
    # @see https://developers.google.com/youtube/v3/docs/commentThreads
    class CommentThread < Resource
      attr_reader :top_level_comment, :total_reply_count, :can_reply, :is_public, :etag

      has_many :comments

      def initialize(options = {})
        @top_level_comment = Comment.new(options[:snippet]['topLevelComment'])
        @total_reply_count = options[:total_reply_count]
        @can_reply = options[:can_reply]
        @is_public = options[:is_public]
        @etag = options[:etag]
        super options
      end

      def has_replies?
        total_reply_count > 0
      end
    end
  end
end