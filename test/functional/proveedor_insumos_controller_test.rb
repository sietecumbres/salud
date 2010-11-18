require 'test_helper'

class ProveedorInsumosControllerTest < ActionController::TestCase
  setup do
    @proveedor_insumo = proveedor_insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proveedor_insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proveedor_insumo" do
    assert_difference('ProveedorInsumo.count') do
      post :create, :proveedor_insumo => @proveedor_insumo.attributes
    end

    assert_redirected_to proveedor_insumo_path(assigns(:proveedor_insumo))
  end

  test "should show proveedor_insumo" do
    get :show, :id => @proveedor_insumo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @proveedor_insumo.to_param
    assert_response :success
  end

  test "should update proveedor_insumo" do
    put :update, :id => @proveedor_insumo.to_param, :proveedor_insumo => @proveedor_insumo.attributes
    assert_redirected_to proveedor_insumo_path(assigns(:proveedor_insumo))
  end

  test "should destroy proveedor_insumo" do
    assert_difference('ProveedorInsumo.count', -1) do
      delete :destroy, :id => @proveedor_insumo.to_param
    end

    assert_redirected_to proveedor_insumos_path
  end
end
