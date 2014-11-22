require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do
  describe '#index' do
    let!(:student_created) { create(:student) }

    it 'returns OK' do
      get :index
      expect(response).to be_ok
    end

    it 'assigns @students' do
      get :index
      expect(assigns(:students).count).to eq(1)
    end
  end

  describe '#show' do
    let!(:student_created) { create(:student) }

    it 'returns OK' do
      get :show, id: student_created
      expect(response).to be_ok
    end

    it 'assigns @student' do
      get :show, id: student_created
      expect(assigns(:student).name).to eq(student_created.name)
    end
  end

  describe '#create' do
    let(:student_attributes) { attributes_for(:student) }
    subject(:create_student) { post :create, student: student_attributes }

    it 'create new student' do
      expect{ create_student }.to change(Student, :count).by(1)
    end
  end

  describe '#update' do
    let!(:student_created) { create(:student) }
    let(:params) do
      { name: 'New name' }
    end

    it 'update student' do
      post :update, student: params, id: student_created
      expect(assigns(:student).name).to eq('New name')
    end
  end
end
