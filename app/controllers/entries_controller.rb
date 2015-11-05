class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		if @project.nil?
			render 'shared/error'
		else
			@entries = @project.entries
		end
	end

	def new
		@project = Project.find_by(id: params[:project_id])
		if @project
			@entry = Entry.new
		else
			render 'projects/no_project_found'
		end
	end

	def create
		project_id = params[:project_id]
		@project = Project.find_by(id: project_id)
		@entry = @project.entries.new(entry_params)
		if @entry.save
			flash[:notice] = "Project created successfully"
			redirect_to project_entries_path(@project)
		else
			flash[:errors] = @entry.errors.full_messages
			redirect_to new_project_entry_path(@project)
		end
	end

	def edit
		@entry = Entry.find_by(id: params[:id])
	end

	def update
		@entry = Entry.find_by(id:params[:id])
		if @entry.update(entry_params)
			flash[:notice] = "Entry updated successfully!"
			redirect_to project_entries_path(@entry.project)
		else
			flash[:errors] = @entry.errors.full_messages
			redirect_to edit_entry_path(@entry)
		end
	end

	def destroy
		entry = Entry.find_by(id: params[:id])
		entry.destroy
		flash[:notice] = "Entry deleted successfully"
		redirect_to project_entries_path(entry.project)
	end

	private

		def entry_params
			params.require(:entry).permit(:hours, :minutes, :date, :comment, :project_id)
		end
end
