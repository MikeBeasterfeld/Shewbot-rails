unless Rails.env.production?
  config_file = File.expand_path(File.join(Rails.root, '/config/config.yml'))

  config = YAML.load_file(config_file)[Rails.env]

  config.each do |key, value|
    if ENV[key].blank?
      ENV[key] = value
    end
  end
end