class Result < ApplicationRecord
  belongs_to :assignable, polymorphic: true
  belongs_to :user
  belongs_to :attempt
end
