module PopulateData
  def populate_page_with(data)
    data.each do |key, value|
      populate_checkbox(key, value) if is_checkbox?(key) and is_enabled?(key)
      populate_radiobutton(key, value) if is_radiobutton?(key) and is_enabled?(key)
      populate_text(key, value) if is_text?(key) and is_enabled?(key)
    end
  end

end