require 'test_helper'

class TipoalmacensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipoalmacen = tipoalmacens(:one)
  end

  test "should get index" do
    get tipoalmacens_url
    assert_response :success
  end

  test "should get new" do
    get new_tipoalmacen_url
    assert_response :success
  end

  test "should create tipoalmacen" do
    assert_difference('Tipoalmacen.count') do
      post tipoalmacens_url, params: { tipoalmacen: { descripcion: @tipoalmacen.descripcion, nombre: @tipoalmacen.nombre } }
    end

    assert_redirected_to tipoalmacen_url(Tipoalmacen.last)
  end

  test "should show tipoalmacen" do
    get tipoalmacen_url(@tipoalmacen)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipoalmacen_url(@tipoalmacen)
    assert_response :success
  end

  test "should update tipoalmacen" do
    patch tipoalmacen_url(@tipoalmacen), params: { tipoalmacen: { descripcion: @tipoalmacen.descripcion, nombre: @tipoalmacen.nombre } }
    assert_redirected_to tipoalmacen_url(@tipoalmacen)
  end

  test "should destroy tipoalmacen" do
    assert_difference('Tipoalmacen.count', -1) do
      delete tipoalmacen_url(@tipoalmacen)
    end

    assert_redirected_to tipoalmacens_url
  end
end
