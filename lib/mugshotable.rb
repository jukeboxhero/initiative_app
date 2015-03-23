module Mugshotable

  # Include me in objects which have a mugshot_id

  def mugshot(size=48)
    mugshot_id = self.mugshot_id || "DMM1Jh4SJv4x8j8XznJ4pGQrWD6qPXb6"
    "https://mug0.assets-yammer.com/mugshot/images/#{size}x#{size}/#{mugshot_id}"
  end

end