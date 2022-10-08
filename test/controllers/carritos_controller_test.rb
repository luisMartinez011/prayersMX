require "test_helper"

class CarritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrito = carritos(:one)
  end

  test "should get index" do
    get carritos_url, as: :json
    assert_response :success
  end

  test "should create carrito" do
    assert_difference("Carrito.count") do
      post carritos_url, params: { carrito: { productos_id: @carrito.productos_id, usuario_id: @carrito.usuario_id } }, as: :json
    end

    assert_response :created
  end

  test "should show carrito" do
    get carrito_url(@carrito), as: :json
    assert_response :success
  end

  test "should update carrito" do
    patch carrito_url(@carrito), params: { carrito: { productos_id: @carrito.productos_id, usuario_id: @carrito.usuario_id } }, as: :json
    assert_response :success
  end

  test "should destroy carrito" do
    assert_difference("Carrito.count", -1) do
      delete carrito_url(@carrito), as: :json
    end

    assert_response :no_content
  end
end
