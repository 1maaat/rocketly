class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_challenge, only: [:show]

  def index
    @challenges = Challenge.all
  end

  def show
    @artworks = @challenge.artworks
  end

  def create
  end

  def new
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end
end
