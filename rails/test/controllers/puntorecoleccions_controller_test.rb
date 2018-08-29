require 'test_helper'

class PuntorecoleccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puntorecoleccion = puntorecoleccions(:one)
  end

  test "should get index" do
    get puntorecoleccions_url
    assert_response :success
  end

  test "should get new" do
    get new_puntorecoleccion_url
    assert_response :success
  end

  test "should create puntorecoleccion" do
    assert_difference('Puntorecoleccion.count') do
      post puntorecoleccions_url, params: { puntorecoleccion: { descripcion: @puntorecoleccion.descripcion, direccion: @puntorecoleccion.direccion, latitud: @puntorecoleccion.latitud, longitud: @puntorecoleccion.longitud, nombre: @puntorecoleccion.nombre, zona_id: @puntorecoleccion.zona_id } }
    end

    assert_redirected_to puntorecoleccion_url(Puntorecoleccion.last)
  end

  test "should show puntorecoleccion" do
    get puntorecoleccion_url(@puntorecoleccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_puntorecoleccion_url(@puntorecoleccion)
    assert_response :success
  end

  test "should update puntorecoleccion" do
    patch puntorecoleccion_url(@puntorecoleccion), params: { puntorecoleccion: { descripcion: @puntorecoleccion.descripcion, direccion: @puntorecoleccion.direccion, latitud: @puntorecoleccion.latitud, longitud: @puntorecoleccion.longitud, nombre: @puntorecoleccion.nombre, zona_id: @puntorecoleccion.zona_id } }
    assert_redirected_to puntorecoleccion_url(@puntorecoleccion)
  end

  test "should destroy puntorecoleccion" do
    assert_difference('Puntorecoleccion.count', -1) do
      delete puntorecoleccion_url(@puntorecoleccion)
    end

    assert_redirected_to puntorecoleccions_url
  end
end
