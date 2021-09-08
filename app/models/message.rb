class Message < ApplicationRecord

  has_many :messagecommits, dependent: :destroy

end
