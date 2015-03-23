module InitiativesHelper

  def human_date(date)
    date.strftime "%e %b"
  end

  def created_date(date)
    human_date date
  end

end