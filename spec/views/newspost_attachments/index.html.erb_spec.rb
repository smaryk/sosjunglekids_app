require 'spec_helper'

describe "newspost_attachments/index" do
  before(:each) do
    assign(:newspost_attachments, [
      stub_model(NewspostAttachment,
        :newspost_id => 1,
        :file => "File"
      ),
      stub_model(NewspostAttachment,
        :newspost_id => 1,
        :file => "File"
      )
    ])
  end

  it "renders a list of newspost_attachments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
