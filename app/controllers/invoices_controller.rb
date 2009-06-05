require 'ostruct'
class InvoicesController < ApplicationController
  def show
    @client = Client.find(params[:id], :include => :entries)
    @entries = @client.entries
    respond_to do |format|
      format.pdf  { prawnto :prawn => {}, :inline => true }
    end
  end
end