class Arriendo < ActiveRecord::Base
  belongs_to :movie
  belongs_to :serie
  belongs_to :user
  
  def self.ultimo
    ultimo = self.last.id + 1
    return ultimo
  end
end
