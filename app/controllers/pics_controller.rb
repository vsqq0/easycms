class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :update, :destroy]

  # GET /pics
  def index
    @pics = Pic.all

    render json: @pics
  end

  # GET /pics/1
  def show
    render json: @pic
  end

  # POST /pics
  def create
    # binding.pry
    @pic = Pic.new(pic_params)

    if @pic.save
      render json: @pic, status: :created, location: @pic
    else
      render json: @pic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pics/1
  def update
    if @pic.update(pic_params)
      render json: @pic
    else
      render json: @pic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pics/1
  def destroy
    @pic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pic_params
      params.require(:pic).permit(:pic, :cate_detail_id, :category_id)
    end
end
