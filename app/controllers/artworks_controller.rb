class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_challenge, only: %i[new create]

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

    respond_to do |format|
      if @artwork.save
        format.html do
          flash[:notice] = "Artwork created and published to the challenge #{@artwork.challenge.name} !"
          redirect_to challenge_path(@challenge)
        end
        format.json do
          sharehtml = render_to_string(
            partial: 'shared/artworkshare',
            locals: { artwork: @artwork },
            formats: :html
          )
          render json: { success: true, sharehtml: sharehtml }.to_json
        end
      else
        format.html { render 'challenges/show' }
        format.json
        flash[:notice] = "Artwork not created... remember to fill in all the fiels !"
      end
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
