class ArtworksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @challenge = Challenge.find(params[:challenge_id])
    @artwork.challenge = @challenge
    @artwork.save
    redirect_to challenge_path(@challenge)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :selected, :rank)
  end
end
