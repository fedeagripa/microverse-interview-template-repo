class User < ApplicationRecord
  scope :filter_by_status, -> (status) { where status: status }

  def username
    "#{first_name} #{last_name}"
  end
end
