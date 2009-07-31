require File.dirname(__FILE__) + '/../test_helper'

class PaymentsControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :payments
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :payment
  end

  context 'POST to create' do
    setup do
      post :create, :payment => Factory.attributes_for(:payment)
      @payment = Payment.find(:all).last
    end
    
    should_redirect_to 'payment_path(@payment)'
  end

  context 'GET to show' do
    setup do
      @payment = Factory(:payment)
      get :show, :id => @payment.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :payment
  end

  context 'GET to edit' do
    setup do
      @payment = Factory(:payment)
      get :edit, :id => @payment.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :payment
  end

  context 'PUT to update' do
    setup do
      @payment = Factory(:payment)
      put :update, :id => @payment.id, :payment => Factory.attributes_for(:payment)
    end
    should_redirect_to 'payment_path(@payment)'
  end

  context 'DELETE to destroy' do
    setup do
      @payment = Factory(:payment)
      delete :destroy, :id => @payment.id
    end
    should_redirect_to 'payments_path'
  end
end
