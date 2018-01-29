if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAI4GVKUK3A7NOYHRA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory = ENV['arn:aws:s3:::knoll3']
  end
end