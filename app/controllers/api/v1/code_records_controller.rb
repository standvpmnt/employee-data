class Api::V1::CodeRecordsController < ApiController

  def new_code
    @last = CodeRecord.new_code(params[:loc_id])
    render json: @last
  end

end
