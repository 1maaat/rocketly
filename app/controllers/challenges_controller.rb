class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_challenge, only: [:show]

  def index
    @challenges = policy_scope(Challenge)

  end

  def show
    @artworks = @challenge.artworks
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

  def set_challenge
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end
end
