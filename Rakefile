# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Restaurant::Application.load_tasks

task :seed => [:environment] do
    Restaurant.seed
    Violation.seed
    RestaurantViolation.seed
    Cuisine.seed
    RestaurantCuisine.seed
  end
end
