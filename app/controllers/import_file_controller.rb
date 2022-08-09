class ImportFileController < ApplicationController
  respond_to :json
  include ReadCsvFile


  def import_file
    file = params[:file].path.to_s

    CsvReaderWorker::ReaderFileWorker.perform_in(1.second, file)
    render status: :created, json: { message: 'arquivo criado com sucesso!' }
  end
end
