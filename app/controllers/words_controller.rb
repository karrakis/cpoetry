class WordsController < BaseApiController
  before_action :find_word, only: [:show, :update]

  before_action only: :create do
    unless @json.has_key?('word') && @json['word']
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :update do
    unless @json.has_key?('word')
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :create do
    @word = Word.find_by_word(@json['word'])
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
      @word = Word.new
      @word.assign_attributes(@json)
      if @word.save
        render json: @word
      else
         render nothing: true, status: :bad_request
      end
    end
  end

  def update
    @word.assign_attributes(@json)
    if @word.save
        render json: @word
    else
        render nothing: true, status: :bad_request
    end
  end

 private
 def find_word
   @word = Word.find_by_word(params[:word])
   render nothing: true, status: :not_found unless @word.present? && @word.user == @user
 end
end
