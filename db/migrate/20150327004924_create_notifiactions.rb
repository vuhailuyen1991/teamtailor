class CreateNotifiactions < ActiveRecord::Migration
  def change
    create_table :notifiactions do |t|
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
