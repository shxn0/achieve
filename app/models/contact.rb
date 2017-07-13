class Contact < ActiveRecord::Base

#  validates :name, presence: true
#  validates :email, presence: true
#  validates :content, presence: true

  validates :name, :email, :content, presence: true
end

