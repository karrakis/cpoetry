class BillsController < BaseApiController
  before_action :find_bill, only: [:show, :update, :index]

  before_action only: :create do
    unless @json.has_key?('link') && @json['link']
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :update do
    unless @json.has_key?('link')
      render nothing: true, status: :bad_request
    end
  end

  before_action only: :create do
    @bill = Bill.find_by link: @json['link']
  end

  def index
    render json: @bill
  end

  def show
    render json: @bill
  end

  def create
    if @bill.present?
      render nothing: true, status: :conflict
    else
      @bill = Bill.new
      @bill.assign_attributes(@json)
      if @bill.save
        render json: @bill
      else
         render nothing: true, status: :bad_request
      end
    end
  end

  def update
    @bill.assign_attributes(@json['link'])
    if @bill.save
        render json: @bill
    else
        render nothing: true, status: :bad_request
    end
  end

 private
 def find_bill
  logger.debug(@json)
  if @json['id']
    @bill = Bill.find_by id: params[:id]
  elsif @json['bill_kid']
    @bill = Bill.find_by bill_kid: params[:bill_kid]
  else
    @bill = Bill.last
    logger.debug(@bill)
  end
  render nothing: true, status: :not_found unless @bill.present?
 end
end
