FactoryBot.define do
  factory :expense do
    deputy
    expense_type
    provider
    month { 1 }
    year { 2021 }
    document_number { '112562270' }
    document_type { '1' }
    emission_date { '2021-01-01' }
    document_value { 1000 }
    net_value { 1000 }
    gloss_value { 100 }
    document_id { 1 }
    url_document { 'https://www.camara.leg.br/cota-parlamentar/documentos/publ/2227/2021/1.pdf' }
  end
end
