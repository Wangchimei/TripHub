CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["S3_ACCESS_KEY"],
      aws_secret_access_key: ENV["S3_SECRET_KEY"],
      region:                ENV["S3_REGION"],
      path_style:            true,
  }

  config.enable_processing = true

  # 公開・非公開の切り替え
  config.fog_public = true
  # キャッシュの保存期間
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  # キャッシュをS3に保存
  # config.cache_storage = :fog

  # 環境ごとにS3のバケットを指定
  case Rails.env
    when 'production'
      config.fog_directory = ENV['S3_BUCKET']
      config.asset_host = 'https://momento-production.s3-ap-northeast-1.amazonaws.com'
    when 'development'
      # config.fog_directory = 'momento-development'
      # config.asset_host = 'https://momento-development.s3-ap-northeast-1.amazonaws.com'
      # when 'test'
      #   config.fog_directory = 'momento-test'
      #   config.asset_host = 'https://momento-test.s3-ap-northeast-1.amazonaws.com'
  end
end

# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/