require 'rails_helper'

RSpec.describe AttendeesController, type: :controller do
    describe 'GET #new' do

        before do
            get :new
        end


        it 'return OK' do
            expect(response).to be_ok
        end

    end
end