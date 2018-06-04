require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  # This should return the minimal set of attributes required to create a valid
  # Task. As you add validations to Task, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "task1abc", status_id: 1, creator_id: user.id, deadline: Date.today }
  }

  let(:invalid_attributes) {
    { status_id: "aa" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TasksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  it "should have a current_user" do
    sign_in user
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    it "blocks unauthenticated access" do

      get :index

      expect(response).to redirect_to(new_user_session_path)
    end

    it "allows authenticated access" do
      sign_in user

      get :index

      expect(response).to be_successful
      sign_out user
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sign_in user
      task = Task.create! valid_attributes
      get :show, params: {id: task.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      sign_in user
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      sign_in user
      task = Task.create! valid_attributes
      get :edit, params: {id: task.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
   before(:each) do
     sign_in user
   end
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: {task: valid_attributes}, session: valid_session
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: {task: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Task.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {task: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
    end
    context "with valid params" do
      let(:new_attributes) {
        { name: "task2abc", status_id: 2, deadline: Date.new, user_id: user.id }
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        put :update, params: {id: task.to_param, task: new_attributes}, session: valid_session
        task.reload
         expect(assigns(:task).attributes.symbolize_keys[:name]).to eq(new_attributes[:name])
      end

      it "redirects to the task" do
        task = Task.create! valid_attributes
        put :update, params: {id: task.to_param, task: valid_attributes}, session: valid_session
        expect(response).to redirect_to(task)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        task = Task.create! valid_attributes
        put :update, params: {id: task.to_param, task: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
    end
    it "destroys the requested task" do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, params: {id: task.to_param}, session: valid_session
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = Task.create! valid_attributes
      delete :destroy, params: {id: task.to_param}, session: valid_session
      expect(response).to redirect_to(tasks_url)
    end
  end

end
