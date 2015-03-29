class UserSetting < ActiveRecord::Base
  belongs_to :user

  MENTION_SETTINGS = [0 => :normal, 1 => :daily]

  def mention_immediately?
    metion_setting.eql? 0
  end

  def mention_daily?
    mention_setting.eql? 1
  end

end
