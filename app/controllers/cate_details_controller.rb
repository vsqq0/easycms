class CateDetailsController < ApplicationController
  before_action :set_cate_detail, only: [:show, :update, :destroy]

  # GET /cate_details
  def index
    @cate_details = CateDetail.all

    render json: @cate_details
  end

  # GET /cate_details/1
  def show
    render json: {data: @cate_detail,pics: @cate_detail.pics}
  end

  # POST /cate_details
  def create
    @cate_detail = CateDetail.new(cate_detail_params)

    if @cate_detail.save
      render json: @cate_detail, status: :created, location: @cate_detail
    else
      render json: @cate_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cate_details/1
  def update
    if @cate_detail.update(cate_detail_params)
      render json: @cate_detail
    else
      render json: @cate_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cate_details/1
  def destroy
    @cate_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cate_detail
      @cate_detail = CateDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cate_detail_params
      params.require(:cate_detail).permit(:title, :text, :img, :category_id, :link, :subtitle)
    end
end
