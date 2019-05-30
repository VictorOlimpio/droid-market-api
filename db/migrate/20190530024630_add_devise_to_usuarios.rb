class AddDeviseToUsuarios < ActiveRecord::Migration[5.2]
  def change
    # change_table :usuarios do |t|
    #   ## Database authenticatable
    #   # t.string :email#,              null: false, default: ""
    #   t.string :encrypted_password, null: false, default: ""
    #
    #   ## Recoverable
    #   t.string   :reset_password_token
    #   t.datetime :reset_password_sent_at
    #
    #   ## Rememberable
    #   t.datetime :remember_created_at
    #
    #   ## Trackable
    #   t.integer  :sign_in_count, default: 0, null: false
    #   t.datetime :current_sign_in_at
    #   t.datetime :last_sign_in_at
    #   t.string     :current_sign_in_ip
    #   t.string     :last_sign_in_ip
    #
    #   ## Confirmable
    #   # t.string   :confirmation_token
    #   # t.datetime :confirmed_at
    #   # t.datetime :confirmation_sent_at
    #   # t.string   :unconfirmed_email # Only if using reconfirmable
    #
    #   ## Lockable
    #   # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    #   # t.string   :unlock_token # Only if unlock strategy is :email or :both
    #   # t.datetime :locked_at
    #
    #
    # end
    add_column :usuarios, :provider, :string, :null => false, :default => "email"
    add_column :usuarios, :uid, :string, :null => false, :default => ""
    add_column :usuarios, :encrypted_password, :string, null: false, default: ""
    add_column :usuarios, :reset_password_token, :string
    add_column :usuarios, :reset_password_sent_at, :datetime
    add_column :usuarios, :remember_created_at, :datetime
    add_column :usuarios, :sign_in_count, :integer, default: 0, null: false
    add_column :usuarios, :current_sign_in_at, :datetime
    add_column :usuarios, :last_sign_in_at, :datetime
    add_column :usuarios, :current_sign_in_ip, :string
    add_column :usuarios, :confirmation_token, :string
    add_column :usuarios, :last_sign_in_ip, :string
    add_column :usuarios, :nickname, :string
    add_column :usuarios, :tokens, :text

    add_index :usuarios, :email,                unique: true
    add_index :usuarios, [:uid, :provider],     unique: true
    add_index :usuarios, :reset_password_token, unique: true
    add_index :usuarios, :confirmation_token,   unique: true
    # add_index :usuarios, :unlock_token,         unique: true
  end
end
