class DocumentsController < ApplicationController
  before_action :identify_employee

  def create
    @document = @employee.documents.new(document_params)
    if @document.save
      redirect_to employee_documents_path(@employee), 
                notice: "Document successfully saved"
    else
      render :new, notice: "Error while adding record"
    end
  end


  def new
    @document = @employee.documents.new
  end

  def index
    @documents = @employee.documents
    @document_types = DocumentType.all
  end

  private

    def identify_employee
      @employee = Employee.find(params[:employee_id])
    end

    def document_params
      params.require(:document).permit(:document_type_id, docs: [])
    end

end