module ReadCsvFileWorker
  class TransformData
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(file, ceap_year, email)
      CreateDataService.new.call(file, ceap_year, email)
    end
  end
end
