class Permission < ActiveRecord::Base
  belongs_to :profile
  belongs_to :functionality

  validates :functionality, uniqueness: { scope: [:profile],
    message: "This profile already had this funcionality, choose another!" }
end
