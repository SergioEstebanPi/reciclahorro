require 'test_helper'

class ResiduosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @residuo = residuos(:one)
  end

  test "should get index" do
    get residuos_url
    assert_response :success
  end

  test "should get new" do
    get new_residuo_url
    assert_response :success
  end

  test "should create residuo" do
    assert_difference('Residuo.count') do
      post residuos_url, params: { residuo: { descripcion: @residuo.descripcion, nombre: @residuo.nombre, tiporesiduo_id: @residuo.tiporesiduo_id } }
    end

    assert_redirected_to residuo_url(Residuo.last)
  end

  test "should show residuo" do
    get residuo_url(@residuo)
    assert_response :success
  end

  test "should get edit" do
    get edit_residuo_url(@residuo)
    assert_response :success
  end

  test "should update residuo" do
    patch residuo_url(@residuo), params: { residuo: { descripcion: @residuo.descripcion, nombre: @residuo.nombre, tiporesiduo_id: @residuo.tiporesiduo_id } }
    assert_redirected_to residuo_url(@residuo)
  end

  test "should destroy residuo" do
    assert_difference('Residuo.count', -1) do
      delete residuo_url(@residuo)
    end

    assert_redirected_to residuos_url
  end
end
