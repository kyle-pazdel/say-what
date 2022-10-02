class User < ApplicationRecord
  has_secure_password
  include ImageUploader::Attachment(:image)
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  after_create_commit {broadcast_append_to "users"}

  # TODO: Add validations and validation range for conversations
end
