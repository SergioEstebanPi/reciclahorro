require 'test_helper'

class AlmacensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @almacen = almacens(:one)
  end

  test "should get index" do
    get almacens_url
    assert_response :success
  end

  test "should get new" do
    get new_almacen_url
    assert_response :success
  end

  test "should create almacen" do
    assert_difference('Almacen.count') do
      post almacens_url, params: { almacen: { descripcion: @almacen.descripcion, direccion: @almacen.direccion, latitud: @almacen.latitud, longitud: @almacen.longitud, nombre: @almacen.nombre, tipoalmacen_id: @almacen.tipoalmacen_id } }
    end

    assert_redirected_to almacen_url(Almacen.last)
  end

  test "should show almacen" do
    get almacen_url(@almacen)
    assert_response :success
  end

  test "should get edit" do
    get edit_almacen_url(@almacen)
    assert_response :success
  end

  test "should update almacen" do
    patch almacen_url(@almacen), params: { almacen: { descripcion: @almacen.descripcion, direccion: @almacen.direccion, latitud: @almacen.latitud, longitud: @almacen.longitud, nombre: @almacen.nombre, tipoalmacen_id: @almacen.tipoalmacen_id } }
    assert_redirected_to almacen_url(@almacen)
  end

  test "should destroy almacen" do
    assert_difference('Almacen.count', -1) do
      delete almacen_url(@almacen)
    end

    assert_redirected_to almacens_url
  end
end
