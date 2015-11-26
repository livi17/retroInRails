module StaticPagesHelper

	def total_events
		event = Event.count
	end

	def total_events_this_year
		event = Event.where('created_at >= ?', 1.year.ago).count
	end

	def total_events_this_month
		event = Event.where('created_at >= ?', 1.month.ago).count
	end

	def total_events_this_week
		event = Event.where('created_at >= ?', 1.week.ago).count
	end

	def total_events_today
		event = Event.where('created_at >= ?', Time.zone.now.beginning_of_day).count
	end
end
