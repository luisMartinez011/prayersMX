require "test_helper"

class VentasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venta = venta(:one)
  end

  test "should get index" do
    get venta_url, as: :json
    assert_response :success
  end

  test "should create venta" do
    assert_difference("Venta.count") do
      post venta_url, params: { venta: { producto: @venta.producto } }, as: :json
    end

    assert_response :created
  end

  test "should show venta" do
    get venta_url(@venta), as: :json
    assert_response :success
  end

  test "should update venta" do
    patch venta_url(@venta), params: { venta: { producto: @venta.producto } }, as: :json
    assert_response :success
  end

  test "should destroy venta" do
    assert_difference("Venta.count", -1) do
      delete venta_url(@venta), as: :json
    end

    assert_response :no_content
  end
end
