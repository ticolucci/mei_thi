class SpecialDepositsController < ApplicationController
  before_action :set_special_deposit, only: [:show, :edit, :update, :destroy]
  before_filter :forbid_if_not_yours, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    reset_session
    session[:my_deposits] ||= []
    @special_deposit = SpecialDeposit.new
  end

  def edit
  end

  def create
    @special_deposit = SpecialDeposit.new(special_deposit_params)

    if @special_deposit.save
      session[:my_deposits] << @special_deposit.id
      redirect_to @special_deposit, notice: 'Special deposit was successfully created.'
    else
      render :new
    end
  end

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

  def destroy
    @special_deposit.destroy
    respond_to do |format|
      format.html { redirect_to special_deposits_url, notice: 'Special deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_special_deposit
      @special_deposit = SpecialDeposit.find(params[:id])
    end

    def special_deposit_params
      params.require(:special_deposit).permit(:from, :message, :value)
    end

    def forbid_if_not_yours
      head '404' unless session[:my_deposits].detect {|i| i == @special_deposit.id}
    end
end
