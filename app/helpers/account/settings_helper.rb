module Account::SettingsHelper
  def gender_type
    if @setting.gender == 'true'
      "Male"
    else
      "Female"
    end
  end
end
