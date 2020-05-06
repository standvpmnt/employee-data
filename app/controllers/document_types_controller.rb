class DocumentTypesController < ApplicationController

  def index
    @document_types = DocumentType.all
  end


  def new
    @document_type = DocumentType.new
  end

  def create
    @document_type = DocumentType.new(document_type_params)
    if @document_type.save
      flash[:success]="Document Type successfuly saved"
      redirect_to document_types_path
    else
      a=''
      @document_type.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create document because" + a
      render :new
    end
  end


  private

  def document_type_params
    params.require(:document_type).permit(:document_category)
  end


end