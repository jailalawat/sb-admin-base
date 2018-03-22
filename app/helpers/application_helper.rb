module ApplicationHelper


  
  def users_for_options
    Setting.active.where(group: "user_name").map{|x| [x.value]}.sort
  end

  def preset_category_options
    PresetCategory.all.map{|x| [x.title,x.id ]}.to_h
  end

  def ips_for_hash
    Setting.active.where(group: "ips").inject(Hash.new()) { |memo,current | memo[current.value]=current.label; memo }
  end
  def get_new_GUID
    SecureRandom.uuid
  end
  def store_dir(sId)
    "public/uploads/GeneratedProducts/#{sId}"
  end

  def preset_upload_dir
    "public/uploads/presets/"
  end
end
