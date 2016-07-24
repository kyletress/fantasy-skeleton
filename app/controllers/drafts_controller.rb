class DraftsController < ApplicationController
  def show
    @league = League.find(params[:league_id])
    @draft = @league.draft
    @athletes = @draft.available_athletes
    @picks = @draft.draft_picks
    @available_picks = @picks.available.limit(8)
    @teams = @league.teams
    @current_pick = @draft.current_pick
  end

  def new
    @league = League.find(params[:league_id])
    @draft = @league.build_draft
  end

  def create
    @league = League.find(params[:league_id])
    @draft = @league.build_draft(draft_params)
    if @draft.save
      flash[:success] = "Draft created"
      redirect_to @league
    else
      render 'new'
    end
  end

  def edit
    @league = League.find(params[:league_id])
    @draft = @league.draft
  end

  def update
    @league = League.find(params[:league_id])
    @draft = @league.draft
    if @draft.update_attributes(draft_params)
      flash[:success] = "Successfully updated"
      redirect_to @league
    else
      render 'edit'
    end
  end

  def setup_draft
    @league = League.find(params[:league_id])
    @teams = @league.teams.order(:pick) # randomize this
    total_teams = @teams.count
    total_rounds = 4 # make this a configurable setting
    total_picks = total_teams * total_rounds

    round = 1
    pick = 1

    for i in 1..total_picks
      #which order are the teams in / snake draft
      teams_in_order_for_round = round.odd? ? @teams : @teams.reverse
      DraftPick.create(round: round, pick: pick, team: teams_in_order_for_round[pick-1], draft: @league.draft)
      # increment the round/pick
      if pick == total_teams
        round += 1
        pick = 1
      else
        pick += 1
      end
    end
    @league.draft.update_attributes(round: 1, pick: 1)
    redirect_to league_path(@league), success: 'Draft is ready'
  end

  private

    def draft_params
      params.require(:draft).permit(:league_id, :starts_at)
    end
end
