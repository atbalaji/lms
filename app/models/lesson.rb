class Lesson < ApplicationRecord
  belongs_to :course

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true
end
