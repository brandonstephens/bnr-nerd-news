class DownVotesController < ApplicationController
  def create
    @vote = current_user.down_votes.new(vote_params)

    if @vote.save
      flash[:success] = 'Voted'
    else
      binding.pry
      flash[:error] = 'Vote could not be saved'
    end

    redirect_to @vote.votable
  end

  private

  def vote_params
    params[:down_vote].permit(:votable_type, :votable_id)
  end

end