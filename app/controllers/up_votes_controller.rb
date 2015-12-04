class UpVotesController < ApplicationController
  def create
    @vote = current_user.up_votes.new(vote_params)

    if @vote.save
      flash[:success] = 'Voted'
    else
      flash[:error] = 'Vote could not be saved'
    end

    redirect_to @vote.votable
  end

  private

  def vote_params
    params[:up_vote].permit(:votable_type, :votable_id)
  end

end