class Task < ActiveRecord::Base
  belongs_to :user

  scope :complete, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  validates :description, length: { maximum: 300, minimum: 2 }
end
