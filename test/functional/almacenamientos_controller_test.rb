require 'test_helper'

class AlmacenamientosControllerTest < ActionController::TestCase
  setup do
    @almacenamiento = almacenamientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:almacenamientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create almacenamiento" do
    assert_difference('Almacenamiento.count') do
      post :create, :almacenamiento => @almacenamiento.attributes
    end

    assert_redirected_to almacenamiento_path(assigns(:almacenamiento))
  end

  test "should show almacenamiento" do
    get :show, :id => @almacenamiento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @almacenamiento.to_param
    assert_response :success
  end

  test "should update almacenamiento" do
    put :update, :id => @almacenamiento.to_param, :almacenamiento => @almacenamiento.attributes
    assert_redirected_to almacenamiento_path(assigns(:almacenamiento))
  end

  test "should destroy almacenamiento" do
    assert_difference('Almacenamiento.count', -1) do
      delete :destroy, :id => @almacenamiento.to_param
    end

    assert_redirected_to almacenamientos_path
  end
end
