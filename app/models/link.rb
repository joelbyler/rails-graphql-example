class Link < ApplicationRecord
  scope :like, ->(field, value) { where arel_table[field].matches("%#{value}%") }

  belongs_to :user, optional: true # Prevent ActiveRecord::RecordInvalid

  validates :url, presence: true, length: { minimum: 5 }
  validates :caption, presence: true, length: { minimum: 5 }

  has_many :votes

end
