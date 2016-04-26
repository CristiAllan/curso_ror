require 'rails_helper'

RSpec.describe TalksController, type: :controller do
    describe 'GET #index' do

        before do
            Talk.create!(title: "Titulo", description: "Qualquer", start: "10:00:00", finish: "11:00:00")
            get :index
        end


        it 'return OK' do
            expect(response).to be_ok
        end
    end

    describe 'GET #show' do

        #let(:talk) {Talk.create!(title: "Titulo", description: "Qualquer", start: "10:00:00", finish: "11:00:00")}

        before do
            @talk = Talk.create!(title: "Titulo", description: "Qualquer", start: "10:00:00", finish: "11:00:00")
            get :show, id: @talk.slug
        end


        it 'return OK' do
            expect(response).to be_ok
        end

        it 'include talk details' do
             expect(assigns(:talk)).to eq(@talk)
             #expect(response.body).to include(@talk.title)
             #expect(response.body).to include(@talk.description)
        end
    end
end