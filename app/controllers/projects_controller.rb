class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
    def index
      @projects = Project.all
      if @projects.empty?
        flash.now[:notice] = 'No projects found. You can create a new project below.'
      end
    end
  
    def show
    end
  
    def new
      @project = Project.new
    end
  
    def edit
    end
  
    def create
      @project = Project.new(project_params)
  
      if @project.save
        redirect_to @project, notice: 'Project was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @project.update(project_params)
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path, notice: 'Project was successfully destroyed.'
    end
    
               
  
    private
  
    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to projects_path, alert: 'Project not found.'
    end
  
    def project_params
      params.require(:project).permit(:name, :description)
    end
  end
  