require 'spec_helper'
require 'yt/models/comment'

describe Yt::Comment do
  subject(:comment) { Yt::Comment.new attrs }

  comment_item = {
    "kind" => "youtube#comment",
    "etag" => "tbWC5XrSXxe1WOAx6MK9z4hHSU8/RsYpMYEqENJVvcPGyRZg6M3dB1M",
    "id" => "z13kh3azyku3sjssg23sg1dxzxvcfvkp104.1430775294423080",
    "snippet" => {
      "textDisplay" => "\u003cspan class=\"proflinkWrapper\"\u003e\u003cspan class=\"proflinkPrefix\"\u003e+\u003c/span\u003e\u003ca class=\"proflink\" href=\"https://plus.google.com/103743566087297217908\" oid=\"103743566087297217908\"\u003eCRS Liveworld\u003c/a\u003e\u003c/span\u003e and aaannnnnother reply!!! will updated change?",
      "textOriginal" => "@103743566087297217908 and aaannnnnother reply!!! will updated change?",
      "parentId" => "z13kh3azyku3sjssg23sg1dxzxvcfvkp104",
      "authorDisplayName" => "CRS Liveworld",
      "authorProfileImageUrl" => "https://lh3.googleusercontent.com/-LcuvZXkOLMQ/AAAAAAAAAAI/AAAAAAAAABY/RnHnRdUF55E/photo.jpg?sz=50",
      "authorChannelUrl" => "http://www.youtube.com/user/crsdevs",
      "authorChannelId" => {
       "value" => "UCSD8XRCainPt4EG5FNMipkA"
      },
      "canRate" => true,
      "viewerRating" => "none",
      "likeCount" => 0,
      "publishedAt" => "2015-05-04T21:34:54.423Z",
      "updatedAt" => "2015-05-04T21:34:54.423Z"
    }
  }

  let(:attrs) { Yt::Collections::Comments.new.send(:attributes_for_new_item, comment_item) }

  describe '#snippet' do
    context 'given fetching a comment returns a snippet' do
      it { expect(comment.snippet).to be_a Yt::Snippet }
    end
  end

  describe 'the comment' do
    it { expect(comment).to be_a Yt::Comment }
    it { expect(comment.id).to eq 'z13kh3azyku3sjssg23sg1dxzxvcfvkp104.1430775294423080' }
    it { expect(comment.etag).to eq 'tbWC5XrSXxe1WOAx6MK9z4hHSU8/RsYpMYEqENJVvcPGyRZg6M3dB1M' }
    it { expect(comment.text_display).to eq "<span class=\"proflinkWrapper\"><span class=\"proflinkPrefix\">+</span><a class=\"proflink\" href=\"https://plus.google.com/103743566087297217908\" oid=\"103743566087297217908\">CRS Liveworld</a></span> and aaannnnnother reply!!! will updated change?" }
    it { expect(comment.text_original).to eq '@103743566087297217908 and aaannnnnother reply!!! will updated change?' }
    it { expect(comment.parent_id).to eq 'z13kh3azyku3sjssg23sg1dxzxvcfvkp104' }
    it { expect(comment.author_display_name).to eq 'CRS Liveworld' }
    it { expect(comment.author_profile_image_url).to eq 'https://lh3.googleusercontent.com/-LcuvZXkOLMQ/AAAAAAAAAAI/AAAAAAAAABY/RnHnRdUF55E/photo.jpg?sz=50' }
    it { expect(comment.author_channel_url).to eq 'http://www.youtube.com/user/crsdevs' }
    it { expect(comment.author_channel_id).to eq 'UCSD8XRCainPt4EG5FNMipkA' }
    it { expect(comment.published_at).to eq '2015-05-04T21:34:54.423Z' }
    it { expect(comment.updated_at).to eq '2015-05-04T21:34:54.423Z' }
    it { expect(comment.can_rate).to eq true }
    it { expect(comment.viewer_rating).to eq 'none' }
    it { expect(comment.like_count).to eq 0 }
  end

  describe '#insert' do
    pending "create a comment"
  end

  describe '#delete' do
    pending "delete a comment"
  end
end