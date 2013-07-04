class User < ActiveRecord::Base
  attr_accessible :first_name, :second_name, :email, :birthday, :shoe_size
  attr_accessible :ice_cream, :superhero, :movie_star, :world_end, :super_bowl_winner
end
