class Initiative < ActiveRecord::Base
  include Mugshotable
  include OpenGraph
  acts_as_taggable
	has_many :groups
	has_many :users

  default_scope { order('start_date ASC, name ASC') }

  validates :name, presence: true, uniqueness: true
  validates :start_date, presence: true

end
