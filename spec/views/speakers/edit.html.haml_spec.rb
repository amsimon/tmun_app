require 'spec_helper'

describe "speakers/edit" do
  before(:each) do
    @speaker = assign(:speaker, stub_model(Speaker,
      :portrait_url => "MyText",
      :name => "MyText",
      :committee_name => "MyText",
      :bio => "MyText"
    ))
  end

  it "renders the edit speaker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", speaker_path(@speaker), "post" do
      assert_select "textarea#speaker_portrait_url[name=?]", "speaker[portrait_url]"
      assert_select "textarea#speaker_name[name=?]", "speaker[name]"
      assert_select "textarea#speaker_committee_name[name=?]", "speaker[committee_name]"
      assert_select "textarea#speaker_bio[name=?]", "speaker[bio]"
    end
  end
end
