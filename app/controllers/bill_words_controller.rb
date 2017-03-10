class BillWordsController < BaseApiController
  before_action :find_billword, only: [:show, :update, :index]

  before_action only: :create do
    unless @json.has_key?('word_kid') && @json['word_kid'] && @json.has_key?('bill_kid') && @json['bill_kid']
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :update do
    unless @json.has_key?('word_kid') and @json.has_key('bill_kid')
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :create do
    @billword = BillWord.find_by bill_kid: @json['bill_kid'], word_kid: @json['word_kid']
  end

  def index
    render json: @billword
  end

  def show
    render json: @billword
  end

  def create
    if @billword.present?
      render nothing: true, status: :conflict
    else
      @billword = BillWord.new
      @billword.assign_attributes(@json)
      if @billword.save
        render json: @billword
      else
         render nothing: true, status: :bad_request
      end
    end
  end

  def update
    @billword.assign_attributes(@json)
    if @billword.save
        render json: @billword
    else
        render nothing: true, status: :bad_request
    end
  end

 private
 def find_billword
  logger.debug(@json)
  if @json['id']
    @billword = BillWord.find_by id: params[:id]
  elsif @json['word_kid']
    @billword = BillWord.find_by word_kid: params[:word_kid]
  elsif @json['bill_kid']
    @billword = BillWord.find_by bill_kid: params[:bill_kid]
  else
    @billword = BillWord.last
    logger.debug(@billword)
  end
   render nothing: true, status: :not_found unless @billword.present?
 end
end
