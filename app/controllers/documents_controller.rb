class DocumentsController < ApplicationController
  before_action :approved_user
  before_action :identify_employee

  def create
    @document = @employee.documents.new(document_params)
    if @document.save
      flash[:success]="Document successfully saved"
      redirect_to employee_documents_path(@employee)
    else
      a=''
      @document.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create document because" + a
      render :new
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