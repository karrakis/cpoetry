class BillWordsController < ApplicationController
  before_action :set_bill_word, only: [:show, :edit, :update, :destroy]

  # GET /bill_words
  # GET /bill_words.json
  def index
    @bill_words = BillWord.all
  end

  # GET /bill_words/1
  # GET /bill_words/1.json
  def show
  end

  # GET /bill_words/new
  def new
    @bill_word = BillWord.new
  end

  # GET /bill_words/1/edit
  def edit
  end

  # POST /bill_words
  # POST /bill_words.json
  def create
    @bill_word = BillWord.new(bill_word_params)

    respond_to do |format|
      if @bill_word.save
        format.html { redirect_to @bill_word, notice: 'Bill word was successfully created.' }
        format.json { render :show, status: :created, location: @bill_word }
      else
        format.html { render :new }
        format.json { render json: @bill_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_words/1
  # PATCH/PUT /bill_words/1.json
  def update
    respond_to do |format|
      if @bill_word.update(bill_word_params)
        format.html { redirect_to @bill_word, notice: 'Bill word was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_word }
      else
        format.html { render :edit }
        format.json { render json: @bill_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_words/1
  # DELETE /bill_words/1.json
  def destroy
    @bill_word.destroy
    respond_to do |format|
      format.html { redirect_to bill_words_url, notice: 'Bill word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_word
      @bill_word = BillWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_word_params
      params.require(:bill_word).permit(:bill_kid, :word_kid)
    end
end
