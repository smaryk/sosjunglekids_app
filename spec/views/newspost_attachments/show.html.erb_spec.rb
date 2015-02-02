require 'spec_helper'

describe "newspost_attachments/show" do
  before(:each) do
    @newspost_attachment = assign(:newspost_attachment, stub_model(NewspostAttachment,
      :newspost_id => 1,
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/File/)
  end
end
