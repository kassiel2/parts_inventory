class Trait < ActiveRecord::Base
  belongs_to :option
  validates :name, presence: true, uniqueness: true
end
