module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"alert-warning"

		when :notice
			"alert-warning"
		else ""
		end
	end
end
