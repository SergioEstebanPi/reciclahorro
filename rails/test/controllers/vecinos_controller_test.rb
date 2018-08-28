require 'test_helper'

class VecinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vecino = vecinos(:one)
  end

  test "should get index" do
    get vecinos_url
    assert_response :success
  end

  test "should get new" do
    get new_vecino_url
    assert_response :success
  end

  test "should create vecino" do
    assert_difference('Vecino.count') do
      post vecinos_url, params: { vecino: { apellidos: @vecino.apellidos, documento: @vecino.documento, fecha_nacimiento: @vecino.fecha_nacimiento, nombres: @vecino.nombres, usuario_id: @vecino.usuario_id } }
    end

    assert_redirected_to vecino_url(Vecino.last)
  end

  test "should show vecino" do
    get vecino_url(@vecino)
    assert_response :success
  end

  test "should get edit" do
    get edit_vecino_url(@vecino)
    assert_response :success
  end

  test "should update vecino" do
    patch vecino_url(@vecino), params: { vecino: { apellidos: @vecino.apellidos, documento: @vecino.documento, fecha_nacimiento: @vecino.fecha_nacimiento, nombres: @vecino.nombres, usuario_id: @vecino.usuario_id } }
    assert_redirected_to vecino_url(@vecino)
  end

  test "should destroy vecino" do
    assert_difference('Vecino.count', -1) do
      delete vecino_url(@vecino)
    end

    assert_redirected_to vecinos_url
  end
end
