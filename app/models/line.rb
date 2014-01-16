class Line < ActiveRecord::Base
	has_many :users
  attr_accessible :description, :name, :status  
end