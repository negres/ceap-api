FactoryBot.define do
  factory :deputy do
    name { 'Deputado Enganação' }
    cpf { '12345678901' }
    register_id { 1 }
    parliamentary_card_number { 2 }
    legislature { 2019 }
    state { 'CE' }
    political_party_acronym { 'CSC' }
    legislature_cod { 3 }
    url_photo { 'image.png' }
  end
end
