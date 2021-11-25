class HelpRequest < ApplicationRecord
    #THIS
  belongs_to :senior, class_name: "User", optional: true, foreign_key: "senior_id"
  belongs_to :helper, class_name: "User", optional: true, foreign_key: "helper_id"

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :task
  has_one :review, dependent: :destroy
  validates :start_time, presence: true, allow_blank: false
  validates :duration, presence: true
  validates :task_id, presence: true
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    completed: 3
  }
end
