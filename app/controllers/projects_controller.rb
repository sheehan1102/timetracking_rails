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

	def new
		@project = Project.new
	end

	def create
		project_info = params[:project]
		title = project_info[:title]
		description = project_info[:description]
		priority = project_info[:priority]
		Project.create(title: title, description: description, priority: priority)
		redirect_to "/projects"
	end
end
