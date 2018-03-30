class CryptsController < ApplicationController
  before_action :set_crypt, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /crypts
  # GET /crypts.json
  def index
    @crypts = Crypt.all
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_crypt = JSON.parse(@response)
  end

  # GET /crypts/1
  # GET /crypts/1.json
  def show
  end

  # GET /crypts/new
  def new
    @crypt = Crypt.new
  end

  # GET /crypts/1/edit
  def edit
  end

  # POST /crypts
  # POST /crypts.json
  def create
    @crypt = Crypt.new(crypt_params)

    respond_to do |format|
      if @crypt.save
        format.html { redirect_to @crypt, notice: 'Crypt was successfully created.' }
        format.json { render :show, status: :created, location: @crypt }
      else
        format.html { render :new }
        format.json { render json: @crypt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypts/1
  # PATCH/PUT /crypts/1.json
  def update
    respond_to do |format|
      if @crypt.update(crypt_params)
        format.html { redirect_to @crypt, notice: 'Crypt was successfully updated.' }
        format.json { render :show, status: :ok, location: @crypt }
      else
        format.html { render :edit }
        format.json { render json: @crypt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypts/1
  # DELETE /crypts/1.json
  def destroy
    @crypt.destroy
    respond_to do |format|
      format.html { redirect_to crypts_url, notice: 'Crypt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypt
      @crypt = Crypt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crypt_params
      params.require(:crypt).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.crypts.find_by(id: params[:id])
      redirect_to crypts_path, notice: 'Not authroized to edit this entry' if @correct.nil?
    end
end
