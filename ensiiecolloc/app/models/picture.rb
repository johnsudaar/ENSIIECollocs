class Picture < ActiveRecord::Base
  validates :colloc_id, presence:true
  belongs_to :colloc
end
