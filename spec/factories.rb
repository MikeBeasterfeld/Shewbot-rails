FactoryGirl.define do
  factory :api do
    name      { Faker::Name.name }
  end

  factory :irc_user do
    name      { Faker::Internet.user_name }
  end

  factory :title do
    title     { Faker::Lorem.sentence }
    irc_user
    show
  end

  factory :link do
    url       { Faker::Internet.url }
    irc_user
    show
  end

  factory :question do
    question  { Faker::Lorem.sentence }
    irc_user
    show
  end

  factory :show do
    title     { Faker::Lorem.sentence }
  end

  # create_table "users", :force => true do |t|
  #   t.string   "name"
  #   t.datetime "created_at",                             :null => false
  #   t.datetime "updated_at",                             :null => false
  #   t.boolean  "admin"
  #   t.string   "remember_token"
  #   t.string   "email",                  :default => "", :null => false
  #   t.string   "encrypted_password",     :default => "", :null => false
  #   t.string   "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer  "sign_in_count",          :default => 0,  :null => false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.string   "current_sign_in_ip"
  #   t.string   "last_sign_in_ip"
  # end

end
