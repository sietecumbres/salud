require 'test_helper'

class TipoAdquisicionsControllerTest < ActionController::TestCase
  setup do
    @tipo_adquisicion = tipo_adquisicions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_adquisicions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_adquisicion" do
    assert_difference('TipoAdquisicion.count') do
      post :create, :tipo_adquisicion => @tipo_adquisicion.attributes
    end

    assert_redirected_to tipo_adquisicion_path(assigns(:tipo_adquisicion))
  end

  test "should show tipo_adquisicion" do
    get :show, :id => @tipo_adquisicion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_adquisicion.to_param
    assert_response :success
  end

  test "should update tipo_adquisicion" do
    put :update, :id => @tipo_adquisicion.to_param, :tipo_adquisicion => @tipo_adquisicion.attributes
    assert_redirected_to tipo_adquisicion_path(assigns(:tipo_adquisicion))
  end

  test "should destroy tipo_adquisicion" do
    assert_difference('TipoAdquisicion.count', -1) do
      delete :destroy, :id => @tipo_adquisicion.to_param
    end

    assert_redirected_to tipo_adquisicions_path
  end
end
