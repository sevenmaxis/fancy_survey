require 'open-uri'
require 'uri'
require 'nokogiri'

class User < ActiveRecord::Base

  attr_accessible :first_name, :second_name, :email, :birthday, :shoe_size
  attr_accessible :ice_cream, :superhero, :movie_star, :world_end
  attr_accessible :super_bowl_winner, :image_url

  validates :first_name, :second_name, :email, :birthday, :shoe_size, presence: true
  validates :email, uniqueness: true

  before_save :gifbin

  private

  def gifbin
    doc = Nokogiri::HTML(open(URI.parse('http://gifbin.com/random')))
    self.image_url = doc.css('#gif').first[:src]
  end
end
