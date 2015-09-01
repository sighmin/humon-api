require 'spec_helper'

describe User, 'Validations' do
  it { should validate_presence_of(:device_token) }
end

describe User, 'Associations' do
  it { should have_many(:attendances) }
  it { should have_many(:events).through(:attendances) }
end
