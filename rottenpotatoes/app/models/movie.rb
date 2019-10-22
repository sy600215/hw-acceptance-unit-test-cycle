class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def similar_movies
    if (self.director.blank?)
      return nil
    end
    
    return Movie.where(director: self.director)
  end
end
