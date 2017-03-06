require 'test_helper'

class BillWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_word = bill_words(:one)
  end

  test "should get index" do
    get bill_words_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_word_url
    assert_response :success
  end

  test "should create bill_word" do
    assert_difference('BillWord.count') do
      post bill_words_url, params: { bill_word: { bill_kid: @bill_word.bill_kid, word_kid: @bill_word.word_kid } }
    end

    assert_redirected_to bill_word_url(BillWord.last)
  end

  test "should show bill_word" do
    get bill_word_url(@bill_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_word_url(@bill_word)
    assert_response :success
  end

  test "should update bill_word" do
    patch bill_word_url(@bill_word), params: { bill_word: { bill_kid: @bill_word.bill_kid, word_kid: @bill_word.word_kid } }
    assert_redirected_to bill_word_url(@bill_word)
  end

  test "should destroy bill_word" do
    assert_difference('BillWord.count', -1) do
      delete bill_word_url(@bill_word)
    end

    assert_redirected_to bill_words_url
  end
end
