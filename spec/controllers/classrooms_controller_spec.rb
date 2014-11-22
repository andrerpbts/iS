require 'rails_helper'

RSpec.describe ClassroomsController, :type => :controller do
  describe '#create' do
    let(:student) { create :student }
    let(:course) { create :course }
    let(:classroom_attributes) { attributes_for :classroom, course_id: course }
    subject(:create_classroom) { post :create, student_id: student, classroom: classroom_attributes }

    it 'create new classroom' do
      expect{ create_classroom }.to change(Classroom, :count).by(1)
    end
  end
end
