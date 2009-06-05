require File.dirname(__FILE__) + '/../test_helper'

class ClientsControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :clients
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :client
  end

  context 'POST to create' do
    setup do
      post :create, :client => Factory.attributes_for(:client)
      @client = Client.find(:all).last
    end
    
    should_redirect_to 'client_path(@client)'
  end

  context 'GET to show' do
    setup do
      @client = Factory(:client)
      get :show, :id => @client.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :client
  end

  context 'GET to edit' do
    setup do
      @client = Factory(:client)
      get :edit, :id => @client.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :client
  end

  context 'PUT to update' do
    setup do
      @client = Factory(:client)
      put :update, :id => @client.id, :client => Factory.attributes_for(:client)
    end
    should_redirect_to 'client_path(@client)'
  end

  context 'DELETE to destroy' do
    setup do
      @client = Factory(:client)
      delete :destroy, :id => @client.id
    end
    should_redirect_to 'clients_path'
  end
end
