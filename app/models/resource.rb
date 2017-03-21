class Resource < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :idea

  validates :file, presence: true

end
