class Avatar < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates_processing_of :avatar
  validate :avatar_size_validation

  belongs_to :user
end
