# frozen_string_literal: true

class OpenAccessPolicy < PolicyFinder
  private

  def access
    {
      'api/v1/meals' => {
        'index' => true,
        'show' => true,
        'find' => true
      },
      'api/v1/products' => {
        'index' => true,
        'show' => true
      },
      'api/v1/meal_categories' => {
        'index' => true
      },
      'api/v1/comments' => {
        'index' => true
      }
    }
  end
end
