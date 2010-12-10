require 'test_helper'

class ProveedorEquiposControllerTest < ActionController::TestCase
  setup do
    @proveedor_equipo = proveedor_equipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proveedor_equipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proveedor_equipo" do
    assert_difference('ProveedorEquipo.count') do
      post :create, :proveedor_equipo => @proveedor_equipo.attributes
    end

    assert_redirected_to proveedor_equipo_path(assigns(:proveedor_equipo))
  end

  test "should show proveedor_equipo" do
    get :show, :id => @proveedor_equipo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @proveedor_equipo.to_param
    assert_response :success
  end

  test "should update proveedor_equipo" do
    put :update, :id => @proveedor_equipo.to_param, :proveedor_equipo => @proveedor_equipo.attributes
    assert_redirected_to proveedor_equipo_path(assigns(:proveedor_equipo))
  end

  test "should destroy proveedor_equipo" do
    assert_difference('ProveedorEquipo.count', -1) do
      delete :destroy, :id => @proveedor_equipo.to_param
    end

    assert_redirected_to proveedor_equipos_path
  end
end
