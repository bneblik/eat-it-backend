# frozen_string_literal: true

class UserAccessPolicy < PolicyFinder
  private

  def access
    {
      'api/v1/meals' => {
        'update' => true,
        'destroy' => true,
        'create' => true
      },
      'api/v1/comments' => {
        'update' => true,
        'destroy' => true,
        'create' => true
      },
      'api/v1/fridges' => {
        'update' => true,
        'destroy' => true,
        'create' => true,
        'index' => true
      },
      'api/v1/shopping_lists' => {
        'update' => true,
        'destroy' => true,
        'create' => true,
        'index' => true
      },
      'api/v1/meal_plans' => {
        'update' => true,
        'destroy' => true,
        'create' => true,
        'index' => true,
        'meal_eaten' => true
      }
    }
  end
end
