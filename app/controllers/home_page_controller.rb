class HomePageController < ApplicationController
  def index
    if !student_signed_in?
      sign_out :student
    end

    if !admin_signed_in?
      sign_out :admin
    end

    if !librarian_signed_in?
      sign_out :librarian
    end
  end
end
