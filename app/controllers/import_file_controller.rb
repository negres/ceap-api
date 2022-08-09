class ImportFileController < ApplicationController
  def import_file
    file = params[:file].path.to_s

    CsvReaderWorker::ReaderFileWorker.perform_in(file)
    render status: :created, json: { messsage: 'arquivo criado com sucesso!' }
  end
end
