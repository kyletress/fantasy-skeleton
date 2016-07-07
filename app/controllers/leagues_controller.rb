class LeaguesController < ApplicationController
  before_action :logged_in_user

  def new
    @league = League.new
  end

  def edit
    @league = League.find(params[:id])
  end

  def show
    @league = League.find(params[:id])
  end

  def index
    @leagues = League.all
  end

  def create
    @league = current_user.managed_leagues.build(league_params)
    if @league.save
      flash[:success] = 'Your league has been created'
      redirect_to @league
    else
      render 'new'
    end
  end

  private

    def league_params
      params.require(:league).permit(:name, :manager_id)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
