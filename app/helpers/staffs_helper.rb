module StaffsHelper
  def fullname(staff)
		return "#{staff.first_name} #{staff.last_name}"
	end
end
