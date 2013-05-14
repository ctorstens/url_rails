class Url < ActiveRecord::Base
  before_validation  :create_short_url
  validates          :full, url: true
  validates          :short, uniqueness: true
  belongs_to         :user

  private
  def create_short_url
    return self if short
    self.short = SecureRandom.hex(3)
      # check does short url already exist?
      if Url.where(short: short).empty?
      else
        create_short_url
      end
    end
  end
