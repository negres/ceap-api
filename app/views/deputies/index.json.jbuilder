json.deputies do
  json.array! @deputies do |deputy|
    json.partial! 'deputy', deputy: deputy
  end
end
