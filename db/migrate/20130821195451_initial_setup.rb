class InitialSetup < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, default: false
    end
    add_index :users, :name
    add_index :users, :email
    add_index :users, :login
    add_index :users, :remember_token

    User.create({name: "admin", login: "admin", email: "login@mail.com", password: "000000", password_confirmation: "000000", admin: true}, without_protection: true)

    create_table :projects do |t|
      t.string :name
      t.integer :user_id
    end
    add_index :projects, :name

    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.boolean :status, default: false
      t.integer :priority, default: 1
      t.datetime :deadline
    end
    add_index :tasks, :name
    add_index :tasks, :priority
    add_index :tasks, :deadline
    add_index :tasks, :status
  end
end
