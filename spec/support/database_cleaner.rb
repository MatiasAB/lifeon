RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion)
  end
  
  config.before(:each) do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end