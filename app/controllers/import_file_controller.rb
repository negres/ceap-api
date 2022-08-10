class ImportFileController < ApplicationController
  respond_to :json

  def import_file
    ceap = Ceap.find_by(year: params[:year]).present?

    if params[:file].present? && !ceap
      file = params[:file].path.to_s
      CreateDataService.new.call(file, params[:year])

      render status: :created, json: { message: 'arquivo criado com sucesso!' }
    else
      render status: :bad_request, json: {}
    end
  end
end
