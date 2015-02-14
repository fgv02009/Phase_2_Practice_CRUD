class Connection < ActiveRecord::Base
  belongs_to :blog
  belongs_to :tag

  validates_uniqueness_of :tag, scope: :blog
end
