RSpec.configure do |config|
  #mongo db cleaner
  DatabaseCleaner[:mongoid].db = :default

  # Clear DB
  DatabaseCleaner.clean
  DatabaseCleaner[:mongoid].strategy = :deletion
end
