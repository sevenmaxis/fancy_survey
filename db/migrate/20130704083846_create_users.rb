class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.date :birthday
      t.integer :shoe_size
      t.string :ice_cream
      t.string :superhero
      t.string :movie_star
      t.date :world_end
      t.string :super_bowl_winner
      t.string :image_url

      t.timestamps
    end
  end
end
