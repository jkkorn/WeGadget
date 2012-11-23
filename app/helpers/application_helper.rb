module ApplicationHelper

	def record_mix_panel(mixpanel_to_record)
    "<script type='text/javascript'>mpmetrics.track(#{mixpanel_to_record});</script>" if mixpanel_to_record.present? 
    #it'll only fire, if there is some event to record.
  end

  def list_categories
    @categories = Category.all
  end

end
