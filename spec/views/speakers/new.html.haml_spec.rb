require 'spec_helper'

describe "speakers/new" do
  before(:each) do
    assign(:speaker, stub_model(Speaker,
      :portrait_url => "MyText",
      :name => "MyText",
      :committee_name => "MyText",
      :bio => "MyText"
    ).as_new_record)
  end

  it "renders new speaker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", speakers_path, "post" do
      assert_select "textarea#speaker_portrait_url[name=?]", "speaker[portrait_url]"
      assert_select "textarea#speaker_name[name=?]", "speaker[name]"
      assert_select "textarea#speaker_committee_name[name=?]", "speaker[committee_name]"
      assert_select "textarea#speaker_bio[name=?]", "speaker[bio]"
    end
  end
end
