class Enrollment < ApplicationRecord
  belongs_to :assignable, polymorphic: true
  belongs_to :educable, polymorphic: true
end
