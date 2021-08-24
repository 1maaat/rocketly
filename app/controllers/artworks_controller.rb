class ArtworksController < ApplicationController
  before_action :set_challenge, only: [:new]

  def index
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    @challenge = Challenge.find(params[:challenge_id])
    @artwork.challenge = @challenge
    if @artwork.save
      flash[:notice] = "Artwork created and published to the #{@challenge.name} !"
      redirect_to challenge_path(@challenge)
    else
      redirect_to challenge_path(@challenge)
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :selected, :rank)
  end
end
