class CreateTwitterOauthSettings < ActiveRecord::Migration
  def change
    create_table :twitter_oauth_settings do |t|
      t.string :atoken
      t.string :asecret
      t.integer :user_id

      t.timestamps
    end
  end
end
