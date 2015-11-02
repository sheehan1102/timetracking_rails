class Project < ActiveRecord::Base

	def self.low_priority
		where('priority > 2')
	end

	def self.clean_low_priority
		where('priority > 2').destroy_all
	end

	def self.high_priority_first
		order('priority ASC')
	end
end
