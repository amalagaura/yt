require 'spec_helper'
require 'yt/models/comment_thread'

describe Yt::CommentThread do
  subject(:comment_thread) { Yt::CommentThread.new attrs }

  comment_thread_item = {
    "kind" => "youtube#commentThread",
    "etag" => "tbWC5XrSXxe1WOAx6MK9z4hHSU8/hM0aJF5l8xNIlTzLdZhPyuXdo30",
    "id" => "z13kh3azyku3sjssg23sg1dxzxvcfvkp104",
    "snippet" => {
      "channelId" => "UCSD8XRCainPt4EG5FNMipkA",
      "videoId" => "-P7_0kktN8A",
      "topLevelComment" => {
        "kind" => "youtube#comment",
        "etag" => "tbWC5XrSXxe1WOAx6MK9z4hHSU8/nCUxM7ZgHc-iG2eA-RigkKtAAgM",
        "id" => "z13kh3azyku3sjssg23sg1dxzxvcfvkp104",
        "snippet" => {
          "channelId" => "UCSD8XRCainPt4EG5FNMipkA",
          "videoId" => "-P7_0kktN8A",
          "textDisplay" => "YOO HOOO\ufeff",
          "textOriginal" => "YOO HOOO",
          "authorDisplayName" => "CRS Liveworld",
          "authorProfileImageUrl" => "https://lh3.googleusercontent.com/-LcuvZXkOLMQ/AAAAAAAAAAI/AAAAAAAAABY/RnHnRdUF55E/photo.jpg?sz=50",
          "authorChannelUrl" => "http://www.youtube.com/user/crsdevs",
          "authorChannelId" => {
           "value" => "UCSD8XRCainPt4EG5FNMipkA"
          },
          "canRate" => true,
          "viewerRating" => "none",
          "likeCount" => 0,
          "publishedAt" => "2015-05-04T16:11:55.407Z",
          "updatedAt" => "2015-05-04T16:11:55.407Z"
        }
      },
    "canReply" => true,
    "totalReplyCount" => 2,
    "isPublic" => true
    }
  }

  let(:attrs) { Yt::Collections::CommentThreads.new.send(:attributes_for_new_item, comment_thread_item) }

  describe '#snippet' do
    context 'given fetching a comment thread returns a snippet' do
      it { expect(comment_thread.snippet).to be_a Yt::Snippet }
    end
  end

  describe 'the comment_thread' do
    it { expect(comment_thread.can_reply).to eq true }
    it { expect(comment_thread.total_reply_count).to eq 2 }
    it { expect(comment_thread.is_public).to eq true }
    it { expect(comment_thread.etag).to eq 'tbWC5XrSXxe1WOAx6MK9z4hHSU8/hM0aJF5l8xNIlTzLdZhPyuXdo30'}
  end

  describe 'the top_level_comment' do
    let(:top_level_comment) {comment_thread.top_level_comment}
    it { expect(top_level_comment).to be_a Yt::Comment }
    it { expect(top_level_comment.id).to eq 'z13kh3azyku3sjssg23sg1dxzxvcfvkp104' }
    it { expect(top_level_comment.etag).to eq 'tbWC5XrSXxe1WOAx6MK9z4hHSU8/nCUxM7ZgHc-iG2eA-RigkKtAAgM' }
    it { expect(top_level_comment.channel_id).to eq 'UCSD8XRCainPt4EG5FNMipkA' }
    it { expect(top_level_comment.video_id).to eq '-P7_0kktN8A' }
    it { expect(top_level_comment.text_display).to eq "YOO HOOO\ufeff" }
    it { expect(top_level_comment.text_original).to eq 'YOO HOOO' }
    it { expect(top_level_comment.parent_id).to be_nil }
    it { expect(top_level_comment.author_display_name).to eq 'CRS Liveworld' }
    it { expect(top_level_comment.author_profile_image_url).to eq 'https://lh3.googleusercontent.com/-LcuvZXkOLMQ/AAAAAAAAAAI/AAAAAAAAABY/RnHnRdUF55E/photo.jpg?sz=50' }
    it { expect(top_level_comment.author_channel_url).to eq 'http://www.youtube.com/user/crsdevs' }
    it { expect(top_level_comment.author_channel_id).to eq 'UCSD8XRCainPt4EG5FNMipkA' }
    it { expect(top_level_comment.published_at).to eq '2015-05-04T16:11:55.407Z' }
    it { expect(top_level_comment.updated_at).to eq '2015-05-04T16:11:55.407Z' }
    it { expect(top_level_comment.can_rate).to eq true }
    it { expect(top_level_comment.viewer_rating).to eq 'none' }
    it { expect(top_level_comment.like_count).to eq 0 }
  end

  describe '#insert' do
    pending "create a top level comment"
  end

  describe '#delete' do
    pending "delete a top level comment"
  end
end