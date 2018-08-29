require 'test_helper'

class TipoproductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipoproducto = tipoproductos(:one)
  end

  test "should get index" do
    get tipoproductos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipoproducto_url
    assert_response :success
  end

  test "should create tipoproducto" do
    assert_difference('Tipoproducto.count') do
      post tipoproductos_url, params: { tipoproducto: { descripcion: @tipoproducto.descripcion, nombre: @tipoproducto.nombre } }
    end

    assert_redirected_to tipoproducto_url(Tipoproducto.last)
  end

  test "should show tipoproducto" do
    get tipoproducto_url(@tipoproducto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipoproducto_url(@tipoproducto)
    assert_response :success
  end

  test "should update tipoproducto" do
    patch tipoproducto_url(@tipoproducto), params: { tipoproducto: { descripcion: @tipoproducto.descripcion, nombre: @tipoproducto.nombre } }
    assert_redirected_to tipoproducto_url(@tipoproducto)
  end

  test "should destroy tipoproducto" do
    assert_difference('Tipoproducto.count', -1) do
      delete tipoproducto_url(@tipoproducto)
    end

    assert_redirected_to tipoproductos_url
  end
end
