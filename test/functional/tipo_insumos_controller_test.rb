require 'test_helper'

class TipoInsumosControllerTest < ActionController::TestCase
  setup do
    @tipo_insumo = tipo_insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_insumo" do
    assert_difference('TipoInsumo.count') do
      post :create, :tipo_insumo => @tipo_insumo.attributes
    end

    assert_redirected_to tipo_insumo_path(assigns(:tipo_insumo))
  end

  test "should show tipo_insumo" do
    get :show, :id => @tipo_insumo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_insumo.to_param
    assert_response :success
  end

  test "should update tipo_insumo" do
    put :update, :id => @tipo_insumo.to_param, :tipo_insumo => @tipo_insumo.attributes
    assert_redirected_to tipo_insumo_path(assigns(:tipo_insumo))
  end

  test "should destroy tipo_insumo" do
    assert_difference('TipoInsumo.count', -1) do
      delete :destroy, :id => @tipo_insumo.to_param
    end

    assert_redirected_to tipo_insumos_path
  end
end
