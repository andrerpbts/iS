require 'rails_helper'

RSpec.describe Student, :type => :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:register_number) }
  it { is_expected.to validate_uniqueness_of(:register_number) }
  it { is_expected.to enumerize(:status)
    .in(:enabled, :disabled).with_default(:enabled) }
end
