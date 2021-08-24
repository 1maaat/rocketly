class ChallengesController < ApplicationController
  def index
  end

  def show
  end

 def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    authorize @challenge
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render :new
    end
  end

  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  private

  def challenge_params
    params.require(:challenge)
          .permit(:name, :description, :reward, :status)
  end
end
