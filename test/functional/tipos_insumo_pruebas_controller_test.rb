require 'test_helper'

class TiposInsumoPruebasControllerTest < ActionController::TestCase
  setup do
    @tipos_insumo_prueba = tipos_insumo_pruebas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_insumo_pruebas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_insumo_prueba" do
    assert_difference('TiposInsumoPrueba.count') do
      post :create, :tipos_insumo_prueba => @tipos_insumo_prueba.attributes
    end

    assert_redirected_to tipos_insumo_prueba_path(assigns(:tipos_insumo_prueba))
  end

  test "should show tipos_insumo_prueba" do
    get :show, :id => @tipos_insumo_prueba.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipos_insumo_prueba.to_param
    assert_response :success
  end

  test "should update tipos_insumo_prueba" do
    put :update, :id => @tipos_insumo_prueba.to_param, :tipos_insumo_prueba => @tipos_insumo_prueba.attributes
    assert_redirected_to tipos_insumo_prueba_path(assigns(:tipos_insumo_prueba))
  end

  test "should destroy tipos_insumo_prueba" do
    assert_difference('TiposInsumoPrueba.count', -1) do
      delete :destroy, :id => @tipos_insumo_prueba.to_param
    end

    assert_redirected_to tipos_insumo_pruebas_path
  end
end
