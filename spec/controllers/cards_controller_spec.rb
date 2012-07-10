require 'spec_helper'


describe CardsController do

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all cards as @cards" do
      card = create(:card)
      get :index, {:project_id => card.project}, valid_session
      assigns(:cards).should eq([card])
    end
  end

  describe "GET show" do
    it "assigns the requested card as @card" do
      card = create(:card)
      get :show, {:id => card.to_param}, valid_session
      assigns(:card).should eq(card)
    end
  end

  describe "GET new" do
    before :each do
      @project = create :project
    end

    it "assigns a new card as @card" do
      get :new, {:project_id => @project.id}, valid_session
      assigns(:card).should be_a_new(Card)
      assigns(:card).project.should == @project
    end
  end

  describe "GET edit" do
    it "assigns the requested card as @card" do
      card = create(:card)
      get :edit, {:id => card.to_param}, valid_session
      assigns(:card).should eq(card)
    end
  end

  describe "POST create" do
    before :each do
      @project = create(:project)
    end

    describe "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, {:card => attributes_for(:card), :project_id => @project.id}, valid_session
        }.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create, {:card => attributes_for(:card), :project_id => @project.id}, valid_session
        assigns(:card).should be_a(Card)
        assigns(:card).should be_persisted
      end

      it "redirects to the created card" do
        post :create, {:card => attributes_for(:card), :project_id => @project.id}, valid_session
        response.should redirect_to(project_card_path(@project.id, Card.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        post :create, {:card => {}, :project_id => @project.id}, valid_session
        assigns(:card).should be_a_new(Card)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        post :create, {:card => {}, :project_id => @project.id}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested card" do
        card = create(:card)
        # Assuming there are no other cards in the database, this
        # specifies that the Card created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Card.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => card.to_param, :card => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested card as @card" do
        card = create(:card)
        put :update, {:id => card.to_param, :card => attributes_for(:card)}, valid_session
        assigns(:card).should eq(card)
      end

      it "redirects to the card" do
        card = create(:card)
        put :update, {:id => card.to_param, :card => attributes_for(:card).merge(:version => card.version + 1)}, valid_session
        response.should redirect_to(project_card_path(card.project, card))
      end
    end

    describe "with invalid params" do
      it "assigns the card as @card" do
        card = create(:card)
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        put :update, {:id => card.to_param, :card => {}}, valid_session
        assigns(:card).should eq(card)
      end

      it "re-renders the 'edit' template" do
        card = create(:card)
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        put :update, {:id => card.to_param, :card => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested card" do
      card = create(:card)
      expect {
        delete :destroy, {:id => card.to_param}, valid_session
      }.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card = create(:card)
      delete :destroy, {:id => card.to_param}, valid_session
      response.should redirect_to(project_cards_path(card.project))
    end
  end

end
