require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    describe 'GET #home' do
        it 'return OK' do
            get :home
            expect(response).to be_ok
        end

        it 'include today date as @date' do
            get :home
            expect(assigns(:date)).to be_a(Date)
            expect(assigns(:date)).to eq(Date.today)
        end

        it 'include lists of talks'
    end
end