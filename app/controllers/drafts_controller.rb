class DraftsController < ApplicationController
  def show
    @league = League.find(params[:league_id])
    @draft = @league.draft
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

  private

    def draft_params
      params.require(:draft).permit(:league_id, :starts_at)
    end
end
