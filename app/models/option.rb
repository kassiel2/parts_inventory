class Option < ActiveRecord::Base
  has_many :traits
  validates :name, presence: true, uniqueness: true
end
