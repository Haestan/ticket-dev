class Ticket < ApplicationRecord

  self.per_page = 10

  belongs_to :category
  belongs_to :user
  has_many :comment

  scope :desc, -> { order(created_at: :desc) }
  scope :resolved, -> { where(resolve: true) }
  scope :unresolved, -> { where(resolve: false) }
  scope :maxposts, -> { limit(5) }

end
