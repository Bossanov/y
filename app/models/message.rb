class Message < ApplicationRecord

  has_many :messagecommits, dependent: :destroy
  has_many_attached :photos

end
