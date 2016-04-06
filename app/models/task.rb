class Task < ActiveRecord::Base
  belongs_to :user

  validates :description, length: { maximum: 300, minimum: 2 }
end
