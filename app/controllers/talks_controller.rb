class TalksController < ApplicationController
    skip_before_filter :authenticate_user!, only:[:index, :show]

    def index
        @talks = Talk.includes(:speaker).order(start: :asc)
    end

    def show
        @talk = Talk.find_by(slug: params[:id])
        @title = @talk.title
    end

    def new
        @talk = Talk.new
        @title = 'Cadastro de Palestra'
        @speakers = Speaker.order(name: :asc)
    end

    def create
        @talk = Talk.new(talk_params)
        @title = 'Cadastro de Palestra'
        @speakers = Speaker.order(name: :asc)
            if @talk.save
                redirect_to root_path, notice: "Palestra cadastrada com sucesso"
            else
                render :new
            end
    end

    private

    def talk_params
        params.require(:talk).permit(:title, :description, :start, :finish, :speaker_id)
    end
end