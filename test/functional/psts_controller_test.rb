require 'test_helper'

class PstsControllerTest < ActionController::TestCase
  setup do
    @pst = psts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:psts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pst" do
    assert_difference('Pst.count') do
      post :create, :pst => { :body => @pst.body, :title => @pst.title }
    end

    assert_redirected_to pst_path(assigns(:pst))
  end

  test "should show pst" do
    get :show, :id => @pst
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pst
    assert_response :success
  end

  test "should update pst" do
    put :update, :id => @pst, :pst => { :body => @pst.body, :title => @pst.title }
    assert_redirected_to pst_path(assigns(:pst))
  end

  test "should destroy pst" do
    assert_difference('Pst.count', -1) do
      delete :destroy, :id => @pst
    end

    assert_redirected_to psts_path
  end
end
