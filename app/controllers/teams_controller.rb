class TeamsController < ApplicationController
  before_action :logged_in_user

  def index
    # this is either the user's leagues, or the team's leagues. hmm.
    @teams = current_user.teams
  end

  def new
    @league = League.find(params[:league_id])
    @team = @league.teams.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @league = League.find(params[:league_id])
    @team = @league.teams.build(team_params)
    @team.user = current_user
    if @team.save
      flash[:success] = "#{@team.name} has joined the league"
      redirect_to @team
    else
      render 'new'
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :user_id, :league_id)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
