class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string      :message
      t.datetime    :notify_at
      t.integer     :candidate_id
      t.integer     :receiver_id
      t.integer     :sender_id
      t.boolean     :deleted, default: false

      t.timestamps null: false
    end
  end
end
