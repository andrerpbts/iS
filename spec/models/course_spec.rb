require 'rails_helper'

RSpec.describe Course, :type => :model do
  it { is_expected.to have_many(:classrooms) }
  it { is_expected.to have_many(:students).through(:classrooms) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to enumerize(:status)
    .in(:active, :inactive).with_default(:active) }
end
