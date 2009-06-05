require File.dirname(__FILE__) + '/../test_helper'

class EntriesControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :entries
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :entry
  end

  context 'POST to create' do
    setup do
      post :create, :entry => Factory.attributes_for(:entry)
      @entry = Entry.find(:all).last
    end
    
    should_redirect_to 'entry_path(@entry)'
  end

  context 'GET to show' do
    setup do
      @entry = Factory(:entry)
      get :show, :id => @entry.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :entry
  end

  context 'GET to edit' do
    setup do
      @entry = Factory(:entry)
      get :edit, :id => @entry.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :entry
  end

  context 'PUT to update' do
    setup do
      @entry = Factory(:entry)
      put :update, :id => @entry.id, :entry => Factory.attributes_for(:entry)
    end
    should_redirect_to 'entry_path(@entry)'
  end

  context 'DELETE to destroy' do
    setup do
      @entry = Factory(:entry)
      delete :destroy, :id => @entry.id
    end
    should_redirect_to 'entries_path'
  end
end
