require 'test_helper'

class FabricantesControllerTest < ActionController::TestCase
  setup do
    @fabricante = fabricantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fabricantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fabricante" do
    assert_difference('Fabricante.count') do
      post :create, :fabricante => @fabricante.attributes
    end

    assert_redirected_to fabricante_path(assigns(:fabricante))
  end

  test "should show fabricante" do
    get :show, :id => @fabricante.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fabricante.to_param
    assert_response :success
  end

  test "should update fabricante" do
    put :update, :id => @fabricante.to_param, :fabricante => @fabricante.attributes
    assert_redirected_to fabricante_path(assigns(:fabricante))
  end

  test "should destroy fabricante" do
    assert_difference('Fabricante.count', -1) do
      delete :destroy, :id => @fabricante.to_param
    end

    assert_redirected_to fabricantes_path
  end
end
