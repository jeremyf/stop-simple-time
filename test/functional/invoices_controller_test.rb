require File.dirname(__FILE__) + '/../test_helper'

class InvoicesControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :invoices
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :invoice
  end

  context 'POST to create' do
    setup do
      post :create, :invoice => Factory.attributes_for(:invoice)
      @invoice = Invoice.find(:all).last
    end
    
    should_redirect_to 'invoice_path(@invoice)'
  end

  context 'GET to show' do
    setup do
      @invoice = Factory(:invoice)
      get :show, :id => @invoice.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :invoice
  end

  context 'GET to edit' do
    setup do
      @invoice = Factory(:invoice)
      get :edit, :id => @invoice.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :invoice
  end

  context 'PUT to update' do
    setup do
      @invoice = Factory(:invoice)
      put :update, :id => @invoice.id, :invoice => Factory.attributes_for(:invoice)
    end
    should_redirect_to 'invoice_path(@invoice)'
  end

  context 'DELETE to destroy' do
    setup do
      @invoice = Factory(:invoice)
      delete :destroy, :id => @invoice.id
    end
    should_redirect_to 'invoices_path'
  end
end
