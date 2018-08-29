require 'test_helper'

class TiporesiduosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiporesiduo = tiporesiduos(:one)
  end

  test "should get index" do
    get tiporesiduos_url
    assert_response :success
  end

  test "should get new" do
    get new_tiporesiduo_url
    assert_response :success
  end

  test "should create tiporesiduo" do
    assert_difference('Tiporesiduo.count') do
      post tiporesiduos_url, params: { tiporesiduo: { descripcion: @tiporesiduo.descripcion, nombre: @tiporesiduo.nombre } }
    end

    assert_redirected_to tiporesiduo_url(Tiporesiduo.last)
  end

  test "should show tiporesiduo" do
    get tiporesiduo_url(@tiporesiduo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tiporesiduo_url(@tiporesiduo)
    assert_response :success
  end

  test "should update tiporesiduo" do
    patch tiporesiduo_url(@tiporesiduo), params: { tiporesiduo: { descripcion: @tiporesiduo.descripcion, nombre: @tiporesiduo.nombre } }
    assert_redirected_to tiporesiduo_url(@tiporesiduo)
  end

  test "should destroy tiporesiduo" do
    assert_difference('Tiporesiduo.count', -1) do
      delete tiporesiduo_url(@tiporesiduo)
    end

    assert_redirected_to tiporesiduos_url
  end
end
