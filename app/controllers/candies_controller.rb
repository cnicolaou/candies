class CandiesController < ApplicationController
  before_action :set_candy, only: [:show, :edit, :update, :destroy]

  # GET /candies
  # GET /candies.json
  def index
    @candies = Candy.all
  end

  # GET /candies/1
  # GET /candies/1.json
  def show
  end

  # GET /candies/new
  def new
    @candy = Candy.new
  end

  # GET /candies/1/edit
  def edit
  end

  # POST /candies
  # POST /candies.json
  def create
    @candy = Candy.new(candy_params)

    respond_to do |format|
      if @candy.save
        # Since the format of the URL has changes, url_for method is used to
        # reconstruct the url
        format.html { redirect_to prepare_url_for(@candy), notice: 'Candy was successfully created.' }
        format.json { render :show, status: :created, location: @candy }
      else
        format.html { render :new }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candies/1
  # PATCH/PUT /candies/1.json
  def update
    respond_to do |format|
      if @candy.update(candy_params)
        # Since the format of the URL has changes, url_for method is used to
        # reconstruct the url
        format.html { redirect_to prepare_url_for(@candy), notice: 'Candy was successfully updated.' }
        format.json { render :show, status: :ok, location: @candy }
      else
        format.html { render :edit }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candies/1
  # DELETE /candies/1.json
  def destroy
    @candy.destroy
    respond_to do |format|
      format.html { redirect_to candies_url, notice: 'Candy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candy
      # Before attempting to find the object in the DB, validate if the desired candy
      # exists in the list of available candies using #include? method
      if Candy.types.include?(params[:candy_type])
        @candy = Candy.find_by(candy_type: params[:candy_type])
      else
        # If the candy is not found, then a 404 error is return to the client
        # and the 404 static page is rendered
        render :file => 'public/404.html', :status => :not_found, :layout => false
      end
    end

    # DRY method to handle building url for an object
    def prepare_url_for(candy)
      url_for(controller: 'candies', action: :show, candy_type: candy.candy_type)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candy_params
      params.require(:candy).permit(:candy_type)
    end
end
