require 'spec_helper'

describe "newspost_attachments/edit" do
  before(:each) do
    @newspost_attachment = assign(:newspost_attachment, stub_model(NewspostAttachment,
      :newspost_id => 1,
      :file => "MyString"
    ))
  end

  it "renders the edit newspost_attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newspost_attachment_path(@newspost_attachment), "post" do
      assert_select "input#newspost_attachment_newspost_id[name=?]", "newspost_attachment[newspost_id]"
      assert_select "input#newspost_attachment_file[name=?]", "newspost_attachment[file]"
    end
  end
end
