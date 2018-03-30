require 'test_helper'

class CryptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypt = crypts(:one)
  end

  test "should get index" do
    get crypts_url
    assert_response :success
  end

  test "should get new" do
    get new_crypt_url
    assert_response :success
  end

  test "should create crypt" do
    assert_difference('Crypt.count') do
      post crypts_url, params: { crypt: { amount_owned: @crypt.amount_owned, cost_per: @crypt.cost_per, symbol: @crypt.symbol, user_id: @crypt.user_id } }
    end

    assert_redirected_to crypt_url(Crypt.last)
  end

  test "should show crypt" do
    get crypt_url(@crypt)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypt_url(@crypt)
    assert_response :success
  end

  test "should update crypt" do
    patch crypt_url(@crypt), params: { crypt: { amount_owned: @crypt.amount_owned, cost_per: @crypt.cost_per, symbol: @crypt.symbol, user_id: @crypt.user_id } }
    assert_redirected_to crypt_url(@crypt)
  end

  test "should destroy crypt" do
    assert_difference('Crypt.count', -1) do
      delete crypt_url(@crypt)
    end

    assert_redirected_to crypts_url
  end
end
