class Injury < ApplicationRecord
  belongs_to :user

  def nicedate(value)
    if(value != nil)
      tmp = Time.at(value).strftime '%d/%m/%Y'
      return tmp
    else
      return nil
    end

  end
end
