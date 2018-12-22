require "rails_helper"

RSpec.describe TasksController, type: :controller do
  let(:user) {User.create(email: "test10@gmail.com", password: "123", password_confirmation: "123",
                          first_name: "Test", last_name: "Name", city: "Cherkassy", avatar: "")}
  let(:task) {Task.create(user_id: user.id, title: "Task", text: "Text")}
  let(:task_params) { task_params = { user_id: user.id, title: "Task", text: "Text"} }
  let(:task_invalid_params) { task_params = { user_id: "", title: ""} }

  before{allow(controller).to receive(:current_user) {user}}

  describe 'GET show' do
    before do
      task
      get :show, params: {id: task.id}
    end

    context 'when params id is present' do
      it {expect(assigns(:task)).to eq task}
    end

    context 'when params id is not present' do
      it {expect(assigns(:task)).not_to eq nil}
    end
  end

  describe 'GET new' do
    before do
      get :new
    end
    context 'should assign the task' do
      it {expect(assigns(:task)).to be_a_new(Task)}
    end

    context 'should return http success' do
      it {expect(response).to have_http_status(:success)}
    end
  end

  describe 'POST create' do
    context 'when params is valid' do
      it do
        expect{
          post :create, params: {task: task_params}
        }.to change(Task, :count).by(1)
      end
    end

    context 'should assign a newly created task' do
      before do
        post :create, params: { task: task_params }
      end

      it do
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end
    end

    context 'when params is invalid' do
      before do
        post :create, params: { task: task_invalid_params }
      end

      it 'should render new' do
        expect(response).to render_template(:new)
      end
    end

    context 'when params is invalid' do
      it do
        expect{
          post :create, params: {task: task_invalid_params}
        }.not_to change(Task, :count)
      end
    end
  end

  describe 'GET edit' do
    before do
      task
      get :edit, params: { id: task.id }
    end

    context 'should assign a task' do
      it do
        expect(assigns(:task)).to eq(task)
      end
    end

    context 'should return http success' do
      it do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT update' do
    before do
      put :update, params: {id: task.id, task: task_params}
    end

    context 'when params is valid' do
      it "should update the task" do
        task.reload

        expect(task.title).to  eq(task_params[:title])
      end

      it 'should redirect to the user with tasks' do
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context 'when params is invalid' do
      it 'does not change task' do
        expect do
          put :update, params: { id: task.id, task: task_invalid_params }
        end.not_to change { task.reload.title }
      end
    end
  end

  describe 'DELETE destroy' do
    before {task}
    context 'should destroy the requested select_option' do
      it do
        expect{
          delete :destroy, params: {id: task.id}
        }.to change(Task, :count).by(-1)
      end
    end

    context 'should redirect to user_path and return successful notice' do
      before do
        delete :destroy, params: {id: task.id}
      end
      it do
        expect(response).to redirect_to user_path
        expect(flash[:notice]).to eq 'task was successfully destroyed.'
      end
    end
  end
end