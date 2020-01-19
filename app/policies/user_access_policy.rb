# frozen_string_literal: true

class UserAccessPolicy < PolicyFinder
  private

  def access
    {
      'api/v1/meals' => {
        'update' => true,
        'destroy' => true,
        'create' => true
      }
    }
  end
end
