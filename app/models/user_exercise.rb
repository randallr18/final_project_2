class UserExercise < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user
  belongs_to :exercise
  # belongs_to :category

  def progress_pct
    number_to_percentage((self.progress/self.goal)*100, precision: 1)
  end

end
