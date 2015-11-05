class Project < ActiveRecord::Base
	validates :title, uniqueness: true
	validates :title, presence: true
	validates :priority, presence: true
	validates :priority, inclusion: { in: [1, 2, 3] }
	validates :title, length: { maximum: 30 }
	validates_format_of :title, with: /^[a-zA-Z\s]*$/u, multiline: true

	has_many :entries, dependent: :destroy


	def self.low_priority
		where('priority > 2')
	end

	def self.clean_low_priority
		where('priority > 2').destroy_all
	end

	def self.high_priority_first
		order('priority ASC')
	end

	def total_hours
		entries.reduce(0) { |sum, entry| sum + entry.hours + (entry.minutes/60.0) }
	end
end
