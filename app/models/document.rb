class Document < ApplicationRecord

  mount_uploader :url, MedicalrecordsUploader
  belongs_to :user

end
