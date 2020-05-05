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
      redirect_to document_types_path, notice:"Document Type successfuly saved"
    else
      render :new, notice: "Error while adding new record"
    end
  end


  private

  def document_type_params
    params.require(:document_type).permit(:document_category)
  end


end