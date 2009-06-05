require File.dirname(__FILE__) + '/../test_helper'

class ProjectsControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :projects
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :project
  end

  context 'POST to create' do
    setup do
      post :create, :project => Factory.attributes_for(:project)
      @project = Project.find(:all).last
    end
    
    should_redirect_to 'project_path(@project)'
  end

  context 'GET to show' do
    setup do
      @project = Factory(:project)
      get :show, :id => @project.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :project
  end

  context 'GET to edit' do
    setup do
      @project = Factory(:project)
      get :edit, :id => @project.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :project
  end

  context 'PUT to update' do
    setup do
      @project = Factory(:project)
      put :update, :id => @project.id, :project => Factory.attributes_for(:project)
    end
    should_redirect_to 'project_path(@project)'
  end

  context 'DELETE to destroy' do
    setup do
      @project = Factory(:project)
      delete :destroy, :id => @project.id
    end
    should_redirect_to 'projects_path'
  end
end
