class Ceap < ApplicationRecord

  def self.create_ceap(year)
    Ceap.find_or_create_by(
      year: year
    )
  end
end
