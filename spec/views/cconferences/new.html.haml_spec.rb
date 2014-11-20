require 'spec_helper'

describe "cconferences/new" do
  before(:each) do
    assign(:cconference, stub_model(Cconference).as_new_record)
  end

  it "renders new cconference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cconferences_path, "post" do
    end
  end
end
