class AttendeesController < ApplicationController

    skip_before_filter :authenticate_user!
    def new
        @attendee = Attendee.new
        @title = 'Inscreva-se'
    end

    def create
        @attendee = Attendee.new(attendee_params)

        if @attendee.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def attendee_params
        params.require(:attendee).permit(:name, :email, :cpf, :phone)
    end
end