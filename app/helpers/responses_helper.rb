module ResponsesHelper
  def status_for(request)
    "fa fa-#{icon_name_for_status request.status}"
  end

  def icon_name_for_status(status)
    case status
    when 'open'
      'question-circle'
    when 'delegated'
      'share'
    when 'answered'
      'commenting'
    when 'accepted'
      'check'
    end
  end
end
