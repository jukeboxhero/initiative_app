class Group < ActiveRecord::Base
  include Mugshotable
	belongs_to :initiative
end
