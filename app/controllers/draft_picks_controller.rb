class DraftPicksController < ApplicationController

  def update
    @pick = DraftPick.find(params[:id])
    if @pick.update_attributes(draft_pick_params)
      @pick.draft.make_pick(@pick.draft.current_team, @pick.athlete)
      redirect_to league_draft_path(@pick.draft.league), notice: 'The pick is in...'
    else
      redirect_to @pick.draft, notice: 'There was an error'
    end
  end

  private

    def draft_pick_params
      params.require(:draft_pick).permit(:athlete_id)
    end

end
