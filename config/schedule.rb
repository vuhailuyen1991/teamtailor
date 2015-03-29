every 1.day, :at => '11:59 pm' do
  rake "mailing:daily_mention"
end
