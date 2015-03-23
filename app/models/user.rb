class User < ActiveRecord::Base
  extend UserFromApi
  include Mugshotable
  acts_as_taggable

	belongs_to :initiative, touch: true

  # All this stuff gets the ephemeral attributes from the API
  # And sets it on the object at runtime. Yay memcache.
  after_create :build_from_api

  def yammer_url
    "https://www.yammer.com/api/v1/users/#{id}"
  end

  def name_and_email_hash
    {
      name: name,
      email: email
    }
  end

  private

    def build_from_api
      params = self.class.from_api(self)
      update_attributes params
      save!
    end

end
