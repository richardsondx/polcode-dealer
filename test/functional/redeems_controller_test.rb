require 'test_helper'

class RedeemsControllerTest < ActionController::TestCase
  setup do
    @redeem = redeems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:redeems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create redeem" do
    assert_difference('Redeem.count') do
      post :create, :redeem => @redeem.attributes
    end

    assert_redirected_to redeem_path(assigns(:redeem))
  end

  test "should show redeem" do
    get :show, :id => @redeem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @redeem.to_param
    assert_response :success
  end

  test "should update redeem" do
    put :update, :id => @redeem.to_param, :redeem => @redeem.attributes
    assert_redirected_to redeem_path(assigns(:redeem))
  end

  test "should destroy redeem" do
    assert_difference('Redeem.count', -1) do
      delete :destroy, :id => @redeem.to_param
    end

    assert_redirected_to redeems_path
  end
end
