module UserFromApi

  def from_api(user)
    res = Yammer.get_user(user.id).body
    # FML
    email = res[:contact][:email_addresses].find {|a| a[:type].to_s =~ /primary/}[:address]

    { id:         res[:id],
      name:       res[:full_name],
      mugshot_id: res[:mugshot_url].split('/').last,
      title:      res[:job_title],
      permalink:  res[:name],
      email:      email }
  end

end