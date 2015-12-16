require 'spec_helper'

describe Yt::Collections::Comments do
  subject(:comments) {  Yt::Collections::Comments.new }

  context '#insert' do

    it "calls insert with the proper parameters" do
      expect(comments).to receive(:do_insert).with({:params=>{:part=>"snippet"}, :body=>{:snippet=>{:textOriginal=>"blah", :parentId=>"123"}}})
      request = double
      allow(Yt::Request).to receive(:new).and_return(request)
      allow(request).to receive(:run).and_return(true)
      comments.insert({part: 'snippet', text_original: 'blah', parent_id: '123'})
    end

  end

  context '#reject' do

    it "calls setModerationStatus with the proper parameters" do
      expect(comments).to receive(:do_set_moderation_status).with({id: 1, moderation_status: 'rejected'})
      request = double
      allow(Yt::Request).to receive(:new).and_return(request)
      allow(request).to receive(:run).and_return(true)
      comments.reject(1)
    end

    it "returns true if the reject was successful" do
      request = double
      allow(Yt::Request).to receive(:new).and_return(request)
      allow(request).to receive(:run).and_return(Net::HTTPNoContent.new nil, nil, nil)
      expect(comments.reject(1)).to eq true
    end

    it "returns false if the reject fails" do
      request = double
      allow(Yt::Request).to receive(:new).and_return(request)
      allow(request).to receive(:run).and_return(Net::HTTPUnauthorized.new nil, nil, nil)
      expect(comments.reject(1)).to eq false
    end

  end

end