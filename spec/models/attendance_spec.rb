require 'spec_helper'

describe Attendance, 'Associations' do
  it { should belong_to(:user) }
  it { should belong_to(:event) }
end
