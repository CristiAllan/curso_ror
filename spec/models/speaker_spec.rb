require 'rails_helper'

RSpec.describe Speaker, type: :model do
    describe 'assossiations' do
        it { should have_many(:talks) }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
    end
end
