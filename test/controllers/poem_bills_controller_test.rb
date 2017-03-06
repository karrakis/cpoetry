require 'test_helper'

class PoemBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poem_bill = poem_bills(:one)
  end

  test "should get index" do
    get poem_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_poem_bill_url
    assert_response :success
  end

  test "should create poem_bill" do
    assert_difference('PoemBill.count') do
      post poem_bills_url, params: { poem_bill: { bill_kid: @poem_bill.bill_kid, poem_kid: @poem_bill.poem_kid } }
    end

    assert_redirected_to poem_bill_url(PoemBill.last)
  end

  test "should show poem_bill" do
    get poem_bill_url(@poem_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_poem_bill_url(@poem_bill)
    assert_response :success
  end

  test "should update poem_bill" do
    patch poem_bill_url(@poem_bill), params: { poem_bill: { bill_kid: @poem_bill.bill_kid, poem_kid: @poem_bill.poem_kid } }
    assert_redirected_to poem_bill_url(@poem_bill)
  end

  test "should destroy poem_bill" do
    assert_difference('PoemBill.count', -1) do
      delete poem_bill_url(@poem_bill)
    end

    assert_redirected_to poem_bills_url
  end
end
