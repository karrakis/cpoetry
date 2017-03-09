class WordsController < BaseApiController
  before_action :find_word, only: [:show, :update]

  before_action only: :create do
    logger.debug("a")
    logger.debug(@json)
    unless @json.has_key?('body') && @json['body'].responds_to?(:[]) && @json['body']['word']
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :update do
    unless @json.has_key?('body')
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :create do
    logger.debug("b")
    @word = Word.find_by_word(@json['body']['word'])
  end

  def index
    render json: Word.where('owner_id = ?', @user.id)
  end

  def show
    render json: @word
  end

  def create
    if @word.present?
      render nothing: true, status: :conflict
    else
      logger.debug(@json)
      @word = Word.new
      @word.assign_attributes(@json['body'])
      if @word.save
        render json: @word
      else
         render nothing: true, status: :bad_request
      end
    end
  end

  def update
    @word.assign_attributes(@json['body'])
    if @word.save
        render json: @word
    else
        render nothing: true, status: :bad_request
    end
  end

 private
 def find_word
  logger.debug("c")
   @word = Word.find_by_word(params[:word])
   render nothing: true, status: :not_found unless @word.present? && @word.user == @user
 end
end
