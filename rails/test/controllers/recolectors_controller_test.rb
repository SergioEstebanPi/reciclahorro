require 'test_helper'

class RecolectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recolector = recolectors(:one)
  end

  test "should get index" do
    get recolectors_url
    assert_response :success
  end

  test "should get new" do
    get new_recolector_url
    assert_response :success
  end

  test "should create recolector" do
    assert_difference('Recolector.count') do
      post recolectors_url, params: { recolector: { apellidos: @recolector.apellidos, empresa: @recolector.empresa, fecha_nacimiento: @recolector.fecha_nacimiento, nombres: @recolector.nombres } }
    end

    assert_redirected_to recolector_url(Recolector.last)
  end

  test "should show recolector" do
    get recolector_url(@recolector)
    assert_response :success
  end

  test "should get edit" do
    get edit_recolector_url(@recolector)
    assert_response :success
  end

  test "should update recolector" do
    patch recolector_url(@recolector), params: { recolector: { apellidos: @recolector.apellidos, empresa: @recolector.empresa, fecha_nacimiento: @recolector.fecha_nacimiento, nombres: @recolector.nombres } }
    assert_redirected_to recolector_url(@recolector)
  end

  test "should destroy recolector" do
    assert_difference('Recolector.count', -1) do
      delete recolector_url(@recolector)
    end

    assert_redirected_to recolectors_url
  end
end
