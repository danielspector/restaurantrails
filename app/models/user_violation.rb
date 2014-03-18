class UserViolation < ActiveRecord::Base
  belongs_to :user
  belongs_to :violation
end