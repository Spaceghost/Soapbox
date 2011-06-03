class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :authorship

  has_many :comments
  has_friendly_id :title, :use_slug => true, :max_length => 35
  validates_presence_of :title, :content
end

