require 'test_helper'

class SubtipoEquiposControllerTest < ActionController::TestCase
  setup do
    @subtipo_equipo = subtipo_equipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subtipo_equipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subtipo_equipo" do
    assert_difference('SubtipoEquipo.count') do
      post :create, :subtipo_equipo => @subtipo_equipo.attributes
    end

    assert_redirected_to subtipo_equipo_path(assigns(:subtipo_equipo))
  end

  test "should show subtipo_equipo" do
    get :show, :id => @subtipo_equipo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subtipo_equipo.to_param
    assert_response :success
  end

  test "should update subtipo_equipo" do
    put :update, :id => @subtipo_equipo.to_param, :subtipo_equipo => @subtipo_equipo.attributes
    assert_redirected_to subtipo_equipo_path(assigns(:subtipo_equipo))
  end

  test "should destroy subtipo_equipo" do
    assert_difference('SubtipoEquipo.count', -1) do
      delete :destroy, :id => @subtipo_equipo.to_param
    end

    assert_redirected_to subtipo_equipos_path
  end
end
