module OpenGraph
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  def to_og
    class_name = self.class.to_s.underscore
    {
      url: send("#{class_name}_url", self, host: 'https://yaminitiatives.herokuapp.com'),
      type: "initiative:#{class_name}",
      title: name,
      image: mugshot(75)
    }
  end

  def activity(opts={})
    {
      activity: {
        actor:  opts[:actor],
        action: opts[:action],
        object: to_og
      },
      private: false,
      message: opts[:message]
    }
  end
end