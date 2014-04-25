module ApplicationHelper
  def mobile?
    request.user_agent.include?('Android') || request.user_agent.include?('Mobile')
  end
end
