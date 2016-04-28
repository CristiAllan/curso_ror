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

    describe 'POST #create' do
        context 'with valid data' do
            let(:params) do
                {"name"=>"Cristi", "email"=>"cristi@teste.com", "cpf"=>"06442783669", "phone"=>"987030798"}
            end

            it 'create a new attendee' do
                expect do
                    post :create, attendee: params
                end.to change(Attendee, :count).from(0).to(1)

                attendee = Attendee.last
                expect(attendee.name).to eq("Cristi")
                expect(attendee.cpf).to eq("06442783669")
                expect(attendee.email).to eq("cristi@teste.com")
                expect(attendee.phone).to eq("987030798")
            end


            it 'redirect to root path' do
                post :create, attendee: params
                expect(response).to redirect_to(root_path)
            end
        end

        context 'with invalid data' do
            let(:params) do
                {"name"=>"Cristi", "email"=>"", "cpf"=>"06442783669", }
            end

            it ' do not create a new attendee' do
                expect do
                    post :create, attendee: params
                end.to_not change(Attendee, :count).from(0)
            end


            it 'render form' do
                post :create, attendee: params
                expect(response).to render_template(:new)
            end
        end
    end
end