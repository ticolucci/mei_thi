module PagesHelper
  def countdown_from(date_string)
    (Date.parse(date_string) - Date.current).to_i
  end
end
