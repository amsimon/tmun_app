require 'spec_helper'

describe "cconferences/edit" do
  before(:each) do
    @cconference = assign(:cconference, stub_model(Cconference))
  end

  it "renders the edit cconference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cconference_path(@cconference), "post" do
    end
  end
end
