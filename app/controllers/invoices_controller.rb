require 'ostruct'
class InvoicesController < ApplicationController
  def show
    @project = Project.find(params[:id], :include => :entries)
    @entries = @project.entries
    respond_to do |format|
      format.pdf  { prawnto :prawn => {}, :inline => true }
    end
  end
end