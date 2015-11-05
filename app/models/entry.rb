class Entry < ActiveRecord::Base
	validates :project, presence: true
	validates :hours, presence: true
	validates :hours, numericality: true
	validates :minutes, presence: true
	validates :minutes, numericality: true
	validates :date, presence: true
	belongs_to :project
end
