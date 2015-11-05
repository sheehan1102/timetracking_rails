module ApplicationHelper
	def flash_message
		if flash[:notice].present?
			content_tag :div, class: "message notice" do
				content_tag :p do
					flash[:notice]
				end
			end
		elsif flash[:errors].present?
			content_tag :ul, class: "message danger" do
				flash[:errors].map do |error|
					concat(content_tag(:li, error))
				end
			end
		end
	end
end