require 'yt/collections/base'
require 'yt/models/comment_thread'

module Yt
  module Collections
    # Provides methods to interact with a collection of YouTube comment threads.
    class CommentThreads < Resources
      def where(requirements = {})
        @published_before = nil
        super
      end

    private

      def attributes_for_new_item(data)
        snippet = data['snippet']
        {}.tap do |attributes|
          attributes[:id] = data['id']
          attributes[:etag] = data['etag']
          attributes[:snippet] = snippet
          attributes[:can_reply] = snippet['canReply']
          attributes[:total_reply_count] = snippet['totalReplyCount']
          attributes[:is_public] = snippet['isPublic']
          attributes[:top_level_comment] = snippet['topLevelComment']
          attributes[:auth] = @auth
        end
      end

      # @return [Hash] the parameters to submit to YouTube to list comment threads.
      def list_params
        super.tap do |params|
          params[:params] = comment_threads_params
          params[:path] = comment_threads_path
        end
      end

      def comment_threads_params
        {}.tap do |params|
          params[:video_id] = @parent.id
          params[:max_results] = 100
          params[:part] = 'snippet'
          params[:order] = 'time'
          params[:text_format] = 'plainText'
          params[:published_before] = @published_before if @published_before
          apply_where_params! params
        end
      end

      def comment_threads_path
        '/youtube/v3/commentThreads'
      end

      def build_insert_body(attributes = {})
        {:snippet => {:videoId => attributes[:video_id], :topLevelComment => {:snippet => {:textOriginal => attributes[:text_original]}}}}
      end

    end
  end
end