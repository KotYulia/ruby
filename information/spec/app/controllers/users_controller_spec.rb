require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) {User.create(email: "test10@gmail.com", password: "123", password_confirmation: "123",
                          first_name: "Test", last_name: "Name", city: "Cherkassy", avatar: "")}
  let(:admin) {User.create(role: "admin", email: "test@gmail.com", password: "123")}
  let(:user_params) { user_params = { email: "test@test.com", password: "321", password_confirmation: "321"} }
  let(:user_invalid_params) { user_params = { email: "test", password: "", password_confirmation: "123"} }

  describe 'GET index' do
    before do
      allow(controller).to receive(:current_user) {admin}
      user
      get :index
    end

    context 'should return all users when user is present' do
      it {expect(assigns(:users)).to include(user)}
    end

    context 'when user is not present' do
      it {expect(assigns(:users)).not_to include(nil)}
    end
  end

  describe 'GET show' do
    before do
      allow(controller).to receive(:current_user) {admin}
      user
      get :show, params: {id: user.id}
    end

    context 'when params id is present' do
      it {expect(assigns(:user)).to eq user}
    end

    context 'when params id is not present' do
      it {expect(assigns(:user)).not_to eq nil}
    end
  end

  describe 'GET new' do
    context 'when current_user is not present' do
      before do
        get :new
      end

      it {expect(assigns(:user)).to be_a_new(User)}
    end

    context 'when current_user is present' do
      before do
        allow(controller).to receive(:current_user) {admin}
        user
        get :new
      end

      it{ expect(response).to redirect_to(root_path)}
    end
  end

  describe 'POST create' do
    context 'when params is valid' do
      it do
        expect{
          post :create, params: {user: user_params}
        }.to change(User, :count).by(1)
      end
    end

    context 'should assign a newly created user' do
      before do
        post :create, params: { user: user_params }
      end

      it do
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    context 'should redirect to the created user' do
      before do
        post :create, params: { user: user_params }
      end

      it do
        expect(response).to redirect_to(edit_user_path(User.last))
      end
    end

    context 'when params is invalid' do
      before do
        post :create, params: { user: user_invalid_params }
      end

      it 'should render new' do
        expect(response).to render_template(:new)
      end
    end

    context 'when params is invalid' do
      it do
        expect{
          post :create, params: {user: user_invalid_params}
        }.not_to change(User, :count)
      end
    end
  end

  describe 'GET edit' do
    before do
      allow(controller).to receive(:current_user) {admin}
      user
      get :edit, params: { id: user.id }
    end

    context 'should assign a user' do
      it do
        expect(assigns(:user)).to eq(user)
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
      allow(controller).to receive(:current_user) {user}
      put :update, params: {id: user.id, user: user_params}
    end

    context 'when params is valid' do
      it "should update the user" do
        user.reload

        expect(user.email).to  eq(user_params[:email])
      end

      it 'should redirect to the current user' do
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context 'when params is invalid' do
      it 'does not change user' do
        expect do
          put :update, params: { id: user.id, user: user_invalid_params }
        end.not_to change { user.reload.email }
      end
    end
  end


  describe 'DELETE destroy' do
    before do
      allow(controller).to receive(:current_user) {admin}
      user
    end

    context 'should destroy the requested select_option' do
      it do
        expect{
          delete :destroy, params: {id: user.id}
        }.to change(User, :count).by(-1)
      end
    end

    context 'should redirect to root_path and return successful notice' do
      before do
        delete :destroy, params: {id: user.id}
      end
      it do
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'user was successfully destroyed.'
      end
    end
  end

end