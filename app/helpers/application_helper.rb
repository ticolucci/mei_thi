module ApplicationHelper
	def in_chinese?
		%w(zh zh-cn).include? I18n.locale.to_s.downcase
	end
end
