require 'test_helper'

class BookHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_history = book_histories(:one)
  end

  test "should get index" do
    get book_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_book_history_url
    assert_response :success
  end

  test "should create book_history" do
    assert_difference('BookHistory.count') do
      post book_histories_url, params: { book_history: { fine_amt: @book_history.fine_amt, is_approved: @book_history.is_approved, is_checked_out: @book_history.is_checked_out, issue_date: @book_history.issue_date, on_hold: @book_history.on_hold, return_date: @book_history.return_date } }
    end

    assert_redirected_to book_history_url(BookHistory.last)
  end

  test "should show book_history" do
    get book_history_url(@book_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_history_url(@book_history)
    assert_response :success
  end

  test "should update book_history" do
    patch book_history_url(@book_history), params: { book_history: { fine_amt: @book_history.fine_amt, is_approved: @book_history.is_approved, is_checked_out: @book_history.is_checked_out, issue_date: @book_history.issue_date, on_hold: @book_history.on_hold, return_date: @book_history.return_date } }
    assert_redirected_to book_history_url(@book_history)
  end

  test "should destroy book_history" do
    assert_difference('BookHistory.count', -1) do
      delete book_history_url(@book_history)
    end

    assert_redirected_to book_histories_url
  end
end
