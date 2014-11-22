require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do
  describe '#index' do
    let!(:course_created) { create(:course) }

    it 'returns OK' do
      get :index
      expect(response).to be_ok
    end

    it 'assigns @courses' do
      get :index
      expect(assigns(:courses).count).to eq(1)
    end
  end

  describe '#show' do
    let!(:course_created) { create(:course) }

    it 'returns OK' do
      get :show, id: course_created
      expect(response).to be_ok
    end

    it 'assigns @course' do
      get :show, id: course_created
      expect(assigns(:course).name).to eq(course_created.name)
    end
  end

  describe '#create' do
    let(:course_attributes) { attributes_for(:course) }
    subject(:create_course) { post :create, course: course_attributes }

    it 'create new course' do
      expect{ create_course }.to change(Course, :count).by(1)
    end
  end

  describe '#update' do
    let!(:course_created) { create(:course) }
    let(:params) do
      { name: 'New name' }
    end

    it 'update course' do
      post :update, course: params, id: course_created
      expect(assigns(:course).name).to eq('New name')
    end
  end
end
