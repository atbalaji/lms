class Course < ApplicationRecord
  belongs_to :user

  has_many :lessons, dependent: :destroy
  has_many :students, through: :enrollments, source: :user
  has_many :enrollments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
end
