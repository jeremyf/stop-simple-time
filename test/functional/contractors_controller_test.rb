require File.dirname(__FILE__) + '/../test_helper'

class ContractorsControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :contractors
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :contractor
  end

  context 'POST to create' do
    setup do
      post :create, :contractor => Factory.attributes_for(:contractor)
      @contractor = Contractor.find(:all).last
    end
    
    should_redirect_to 'contractor_path(@contractor)'
  end

  context 'GET to show' do
    setup do
      @contractor = Factory(:contractor)
      get :show, :id => @contractor.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :contractor
  end

  context 'GET to edit' do
    setup do
      @contractor = Factory(:contractor)
      get :edit, :id => @contractor.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :contractor
  end

  context 'PUT to update' do
    setup do
      @contractor = Factory(:contractor)
      put :update, :id => @contractor.id, :contractor => Factory.attributes_for(:contractor)
    end
    should_redirect_to 'contractor_path(@contractor)'
  end

  context 'DELETE to destroy' do
    setup do
      @contractor = Factory(:contractor)
      delete :destroy, :id => @contractor.id
    end
    should_redirect_to 'contractors_path'
  end
end
