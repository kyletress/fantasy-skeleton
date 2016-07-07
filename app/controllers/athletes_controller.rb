class AthletesController < ApplicationController

  # Athletes are going to come from the sledsheet API, but for now create a few  for testing purposes.

  def index
      @athletes = Athlete.all
    end

    def show
      @athlete = Athlete.find(params[:id])
    end

    def new
      @athlete = Athlete.new
    end

    def create
      @athlete = Athlete.new(athlete_params)
      if @athlete.save
        flash[:success] = "Athlete created."
        redirect_to @athlete
      else
        render 'new'
      end
    end

    def edit
      @athlete = Athlete.find(params[:id])
    end

    def update
      @athlete = Athlete.find(params[:id])
      if @athlete.update_attributes(athlete_params)
        flash[:success] = "Athlete updated."
        redirect_to @athlete
      else
        render 'edit'
      end
    end

    def destroy
      Athlete.find(params[:id]).destroy
      flash[:success] = "Athlete deleted."
      redirect_to athletes_url
    end

    private

      def athlete_params
        params.require(:athlete).permit(:name, :adp)
      end

  end
