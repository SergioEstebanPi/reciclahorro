require 'test_helper'

class EntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrega = entregas(:one)
  end

  test "should get index" do
    get entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_entrega_url
    assert_response :success
  end

  test "should create entrega" do
    assert_difference('Entrega.count') do
      post entregas_url, params: { entrega: { estado: @entrega.estado, peso: @entrega.peso, recolector_id: @entrega.recolector_id, vecino_id: @entrega.vecino_id } }
    end

    assert_redirected_to entrega_url(Entrega.last)
  end

  test "should show entrega" do
    get entrega_url(@entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrega_url(@entrega)
    assert_response :success
  end

  test "should update entrega" do
    patch entrega_url(@entrega), params: { entrega: { estado: @entrega.estado, peso: @entrega.peso, recolector_id: @entrega.recolector_id, vecino_id: @entrega.vecino_id } }
    assert_redirected_to entrega_url(@entrega)
  end

  test "should destroy entrega" do
    assert_difference('Entrega.count', -1) do
      delete entrega_url(@entrega)
    end

    assert_redirected_to entregas_url
  end
end
