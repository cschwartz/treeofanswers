module ResponsesHelper
  def status_for request
    icon = case request.status
    when 'open'
      'question-circle'
    when 'delegated'
      'share'
    when 'answered'
      'commenting'
    when 'accepted'
      'check'
    end

    "fa fa-#{icon}"
  end
end
