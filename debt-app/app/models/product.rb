class Product < ActiveRecord::Base
	validates(:name, :presence => true)
	validates(:description, :presence => true)
	def self.search(search)
		where("name LIKE ?","%#{search}%")
	end
end
