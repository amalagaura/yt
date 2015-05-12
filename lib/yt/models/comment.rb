require 'yt/models/resource'

module Yt
  module Models
    class Comment < Resource
      attr_reader :data, :video_id, :etag

      delegate :channel_id, :video_id, :text_display, :text_original, :parent_id, :author_display_name, :author_profile_image_url,
        :author_channel_url, :author_channel_id, :can_rate, :viewer_rating, :like_count, :updated_at, to: :snippet

      def initialize(options = {})
        @snippet = Snippet.new(data: (options['snippet'] || options[:snippet])) if (options['snippet'] || options[:snippet])
        @auth = options[:auth]
        @id = options['id'] || options[:id]
        @etag = options['etag'] || options[:etag]
      end

      def is_top_level_comment?
        # id matches parent id - need to figure out how to get parent comment thread
      end

    end
  end
end