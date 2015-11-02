class ProjectsController < ApplicationController
	def index
		@projects = Project.high_priority_first
	end

	def show
		id = params[:id]
		project = Project.find_by(id: id)
		if !project.nil?
			@project = project
		else
			render 'no_project_found'
		end
	end
end
