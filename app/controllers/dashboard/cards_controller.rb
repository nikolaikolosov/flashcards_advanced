class Dashboard::CardsController < Dashboard::BaseController
  before_action :set_card, only: [:destroy, :edit, :update]
  before_action :flickr_photos, only: %i(new edit)

  def index
    @cards = current_user.cards.all.order('review_date')
  end

  def new
    @card = Card.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to cards_path
    else
      respond_with @card
    end
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      respond_with @card
    end
  end

  def destroy
    @card.destroy
    respond_with @card
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def flickr_photos
    flickr = Flickr.new(key: ENV['FLICKR_KEY'], secret: ENV['FLICKR_SECRET'])
    @photos = flickr.photos.get_recent.sample(12)
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date,
                                 :image, :image_cache, :remove_image, :block_id, :img_remote_url)
  end
end
