namespace :mailing do
  task :daily_mention => :environment do
    user_ids = User.pluck(:id)
    user_ids.each do |id|
      MentionDailyMailer.daily_email(id).deliver_now
    end
  end
end
