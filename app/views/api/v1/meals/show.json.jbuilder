# frozen_string_literal: true

json.status 'success'
json.description 'Return requested meal'
json.content do
  json.meal do
    json.id @meal.id
    json.name @meal.name
    json.recipe @meal.recipe
  end
end
