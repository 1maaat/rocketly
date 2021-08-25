class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_challenge, only: [:new, :create]

  def index
    @artworks = policy_scope(Artwork)
  end

  def show
    skip_authorization
  end

  def new
    @artwork = Artwork.new
    authorize @artwork
  end

  def create
    @artwork = Artwork.new(artwork_params)
    authorize @artwork
    @artwork.user = current_user
    @artwork.challenge = Challenge.find(params[:challenge_id])
    if @artwork.save
      flash[:notice] = "Artwork created and published to the challenge #{@artwork.challenge.name} !"
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
    params.require(:artwork).permit(:title, :description, :selected, :rank, files: [])
  end
end
