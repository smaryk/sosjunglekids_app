require 'spec_helper'

describe "NewspostAttachments" do
  describe "GET /newspost_attachments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get newspost_attachments_path
      response.status.should be(200)
    end
  end
end
