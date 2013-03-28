Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, ENV['oa7yAf3RMFz25R2gVTDlg'], ENV['dIw3Uuvla9TcX6GtAE87RftRY8RWqmmqJ5ZVfUdsH8']
  #provider :facebook, ENV['140476016130992'], ENV['4172ccd6fde24c1c7ac1a07ea8cb9fb4']
  provider :twitter, 'oa7yAf3RMFz25R2gVTDlg', 'dIw3Uuvla9TcX6GtAE87RftRY8RWqmmqJ5ZVfUdsH8'
  provider :facebook, '140476016130992', '4172ccd6fde24c1c7ac1a07ea8cb9fb4'
end