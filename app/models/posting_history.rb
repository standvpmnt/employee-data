class PostingHistory < ApplicationRecord
  belongs_to :location
  belongs_to :employee
  validates_associated :location
  validates_associated :employee
  validates :start_date, presence: true


  # update this logic to propagate changes to end date throghout the system
  def self.new_posting(posting)
    old_posting = PostingHistory.where(employee_id: posting.employee_id).find_by(end_date: nil)
    old_posting.end_date = posting.start_date - 1.day unless old_posting.blank? || old_posting.start_date > posting.start_date
    if old_posting.blank? || old_posting.save
      true
    else
      false
    end
  end

end
