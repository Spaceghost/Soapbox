class Authorship < ActiveRecord::Base
  belongs_to :user
  has_many :article
end

