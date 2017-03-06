class PoemBillsController < ApplicationController
  before_action :set_poem_bill, only: [:show, :edit, :update, :destroy]

  # GET /poem_bills
  # GET /poem_bills.json
  def index
    @poem_bills = PoemBill.all
  end

  # GET /poem_bills/1
  # GET /poem_bills/1.json
  def show
  end

  # GET /poem_bills/new
  def new
    @poem_bill = PoemBill.new
  end

  # GET /poem_bills/1/edit
  def edit
  end

  # POST /poem_bills
  # POST /poem_bills.json
  def create
    @poem_bill = PoemBill.new(poem_bill_params)

    respond_to do |format|
      if @poem_bill.save
        format.html { redirect_to @poem_bill, notice: 'Poem bill was successfully created.' }
        format.json { render :show, status: :created, location: @poem_bill }
      else
        format.html { render :new }
        format.json { render json: @poem_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poem_bills/1
  # PATCH/PUT /poem_bills/1.json
  def update
    respond_to do |format|
      if @poem_bill.update(poem_bill_params)
        format.html { redirect_to @poem_bill, notice: 'Poem bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @poem_bill }
      else
        format.html { render :edit }
        format.json { render json: @poem_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poem_bills/1
  # DELETE /poem_bills/1.json
  def destroy
    @poem_bill.destroy
    respond_to do |format|
      format.html { redirect_to poem_bills_url, notice: 'Poem bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem_bill
      @poem_bill = PoemBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_bill_params
      params.require(:poem_bill).permit(:poem_kid, :bill_kid)
    end
end
