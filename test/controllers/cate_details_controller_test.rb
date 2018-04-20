require 'test_helper'

class CateDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cate_detail = cate_details(:one)
  end

  test "should get index" do
    get cate_details_url, as: :json
    assert_response :success
  end

  test "should create cate_detail" do
    assert_difference('CateDetail.count') do
      post cate_details_url, params: { cate_detail: { category_id: @cate_detail.category_id, img: @cate_detail.img, link: @cate_detail.link, subtitle: @cate_detail.subtitle, text: @cate_detail.text, title: @cate_detail.title } }, as: :json
    end

    assert_response 201
  end

  test "should show cate_detail" do
    get cate_detail_url(@cate_detail), as: :json
    assert_response :success
  end

  test "should update cate_detail" do
    patch cate_detail_url(@cate_detail), params: { cate_detail: { category_id: @cate_detail.category_id, img: @cate_detail.img, link: @cate_detail.link, subtitle: @cate_detail.subtitle, text: @cate_detail.text, title: @cate_detail.title } }, as: :json
    assert_response 200
  end

  test "should destroy cate_detail" do
    assert_difference('CateDetail.count', -1) do
      delete cate_detail_url(@cate_detail), as: :json
    end

    assert_response 204
  end
end
