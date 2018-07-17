class User < ActiveRecord::Base
  has_many :arriendos , dependent: :destroy
  
  def self.ultimo
    ultimo = self.last.id + 1
    return ultimo
  end
end
