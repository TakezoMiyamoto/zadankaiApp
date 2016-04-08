CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJDARU7YAN4LV6MVA',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'zadankai-app-production'
      

    when 'development'
      config.fog_directory = 'zadankai-app'
      

    when 'test'
      config.fog_directory = 'zadankai-app'
      
  end
end