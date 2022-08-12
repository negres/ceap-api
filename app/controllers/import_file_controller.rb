class ImportFileController < ApplicationController
  respond_to :json

  def import_file
    ceap = Ceap.find_by(year: params[:year]).present?

    if params[:file].present? && !ceap
      file = params[:file].path.to_s
      email = params[:email]
      ceap_year = params[:year]

      ReadCsvFileWorker::TransformData.perform_async(file, ceap_year, email)

      render status: :ok, json: {}
    else
      render status: :bad_request, json: {}
    end
  end
end
