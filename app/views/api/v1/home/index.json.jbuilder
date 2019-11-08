# frozen_string_literal: true

json.status 'success'
json.description 'Return all meals'
json.content do
  json.meals @meals.each do |meal|
    json.id meal.id
    json.name meal.name
  end
end
