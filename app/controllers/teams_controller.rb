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

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "Your team has been updated"
      redirect_to @team
    else
      render 'edit'
    end
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
      params.require(:team).permit(:name, :user_id, :league_id, :avatar)
    end

end
