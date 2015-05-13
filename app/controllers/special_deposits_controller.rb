class SpecialDepositsController < ApplicationController
  before_action :set_special_deposit, only: [:show, :edit, :update, :destroy]

  # GET /special_deposits
  # GET /special_deposits.json
  def index
    @special_deposits = SpecialDeposit.all
  end

  # GET /special_deposits/1
  # GET /special_deposits/1.json
  def show
  end

  # GET /special_deposits/new
  def new
    @special_deposit = SpecialDeposit.new
  end

  # GET /special_deposits/1/edit
  def edit
  end

  # POST /special_deposits
  # POST /special_deposits.json
  def create
    @special_deposit = SpecialDeposit.new(special_deposit_params)

    respond_to do |format|
      if @special_deposit.save
        format.html { redirect_to @special_deposit, notice: 'Special deposit was successfully created.' }
        format.json { render :show, status: :created, location: @special_deposit }
      else
        format.html { render :new }
        format.json { render json: @special_deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_deposits/1
  # PATCH/PUT /special_deposits/1.json
  def update
    respond_to do |format|
      if @special_deposit.update(special_deposit_params)
        format.html { redirect_to @special_deposit, notice: 'Special deposit was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_deposit }
      else
        format.html { render :edit }
        format.json { render json: @special_deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_deposits/1
  # DELETE /special_deposits/1.json
  def destroy
    @special_deposit.destroy
    respond_to do |format|
      format.html { redirect_to special_deposits_url, notice: 'Special deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_deposit
      @special_deposit = SpecialDeposit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_deposit_params
      params.require(:special_deposit).permit(:from, :message, :value)
    end
end
