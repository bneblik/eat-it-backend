# frozen_string_literal: true

class AccessPolicySwitch
  def access_for_user(current_user)
    return ::OpenAccessPolicy.new unless current_user

    ::UserAccessPolicy.new
  end
end
