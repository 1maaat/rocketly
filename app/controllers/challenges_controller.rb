class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
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
