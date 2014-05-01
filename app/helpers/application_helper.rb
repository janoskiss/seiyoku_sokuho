module ApplicationHelper
  def mobile?
    request.user_agent.tap do |ua|
      return ua.include?('Android') || ua.include?('Mobile')
    end
  end
end
