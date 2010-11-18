require 'test_helper'

class FabricanteInsumosControllerTest < ActionController::TestCase
  setup do
    @fabricante_insumo = fabricante_insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fabricante_insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fabricante_insumo" do
    assert_difference('FabricanteInsumo.count') do
      post :create, :fabricante_insumo => @fabricante_insumo.attributes
    end

    assert_redirected_to fabricante_insumo_path(assigns(:fabricante_insumo))
  end

  test "should show fabricante_insumo" do
    get :show, :id => @fabricante_insumo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fabricante_insumo.to_param
    assert_response :success
  end

  test "should update fabricante_insumo" do
    put :update, :id => @fabricante_insumo.to_param, :fabricante_insumo => @fabricante_insumo.attributes
    assert_redirected_to fabricante_insumo_path(assigns(:fabricante_insumo))
  end

  test "should destroy fabricante_insumo" do
    assert_difference('FabricanteInsumo.count', -1) do
      delete :destroy, :id => @fabricante_insumo.to_param
    end

    assert_redirected_to fabricante_insumos_path
  end
end
