require 'spec_helper'

describe "tconferences/new" do
  before(:each) do
    assign(:tconference, stub_model(Tconference).as_new_record)
  end

  it "renders new tconference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tconferences_path, "post" do
    end
  end
end
