json.extract! book_history, :id, :issue_date, :return_date, :is_checked_out, :on_hold, :fine_amt, :is_approved, :created_at, :updated_at
json.url book_history_url(book_history, format: :json)
