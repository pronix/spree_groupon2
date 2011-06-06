class Rake::Task
  def overwrite(&block)
    @actions.clear
    prerequisites.clear
    enhance(&block)
  end
  def abandon
    prerequisites.clear
    @actions.clear
  end
end
Rake::Task["db:admin:create"].abandon

namespace :db do
  namespace :admin do

    desc "Create Spree Groupon2 admin username, password and phone_number"
    task :create=>:environment do
      require File.join(Rails.root, 'db', 'default', 'user.rb')
    end

  end
end
