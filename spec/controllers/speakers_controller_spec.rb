require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SpeakersController do

  # This should return the minimal set of attributes required to create a valid
  # Speaker. As you add validations to Speaker, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "portrait_url" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpeakersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all speakers as @speakers" do
      speaker = Speaker.create! valid_attributes
      get :index, {}, valid_session
      assigns(:speakers).should eq([speaker])
    end
  end

  describe "GET show" do
    it "assigns the requested speaker as @speaker" do
      speaker = Speaker.create! valid_attributes
      get :show, {:id => speaker.to_param}, valid_session
      assigns(:speaker).should eq(speaker)
    end
  end

  describe "GET new" do
    it "assigns a new speaker as @speaker" do
      get :new, {}, valid_session
      assigns(:speaker).should be_a_new(Speaker)
    end
  end

  describe "GET edit" do
    it "assigns the requested speaker as @speaker" do
      speaker = Speaker.create! valid_attributes
      get :edit, {:id => speaker.to_param}, valid_session
      assigns(:speaker).should eq(speaker)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Speaker" do
        expect {
          post :create, {:speaker => valid_attributes}, valid_session
        }.to change(Speaker, :count).by(1)
      end

      it "assigns a newly created speaker as @speaker" do
        post :create, {:speaker => valid_attributes}, valid_session
        assigns(:speaker).should be_a(Speaker)
        assigns(:speaker).should be_persisted
      end

      it "redirects to the created speaker" do
        post :create, {:speaker => valid_attributes}, valid_session
        response.should redirect_to(Speaker.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved speaker as @speaker" do
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        post :create, {:speaker => { "portrait_url" => "invalid value" }}, valid_session
        assigns(:speaker).should be_a_new(Speaker)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        post :create, {:speaker => { "portrait_url" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested speaker" do
        speaker = Speaker.create! valid_attributes
        # Assuming there are no other speakers in the database, this
        # specifies that the Speaker created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Speaker.any_instance.should_receive(:update).with({ "portrait_url" => "MyText" })
        put :update, {:id => speaker.to_param, :speaker => { "portrait_url" => "MyText" }}, valid_session
      end

      it "assigns the requested speaker as @speaker" do
        speaker = Speaker.create! valid_attributes
        put :update, {:id => speaker.to_param, :speaker => valid_attributes}, valid_session
        assigns(:speaker).should eq(speaker)
      end

      it "redirects to the speaker" do
        speaker = Speaker.create! valid_attributes
        put :update, {:id => speaker.to_param, :speaker => valid_attributes}, valid_session
        response.should redirect_to(speaker)
      end
    end

    describe "with invalid params" do
      it "assigns the speaker as @speaker" do
        speaker = Speaker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        put :update, {:id => speaker.to_param, :speaker => { "portrait_url" => "invalid value" }}, valid_session
        assigns(:speaker).should eq(speaker)
      end

      it "re-renders the 'edit' template" do
        speaker = Speaker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        put :update, {:id => speaker.to_param, :speaker => { "portrait_url" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested speaker" do
      speaker = Speaker.create! valid_attributes
      expect {
        delete :destroy, {:id => speaker.to_param}, valid_session
      }.to change(Speaker, :count).by(-1)
    end

    it "redirects to the speakers list" do
      speaker = Speaker.create! valid_attributes
      delete :destroy, {:id => speaker.to_param}, valid_session
      response.should redirect_to(speakers_url)
    end
  end

end