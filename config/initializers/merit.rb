# # Use this hook to configure merit parameters
# Merit.setup do |config|
#   # Check rules on each request or in background
#   # config.checks_on_each_request = true
#
#   # Define ORM. Could be :active_record (default) and :mongoid
#   # config.orm = :active_record
#
#   # Add application observers to get notifications when reputation changes.
#   # config.add_observer 'MyObserverClassName'
#
#   # Define :user_model_name. This model will be used to grand badge if no
#   # `:to` option is given. Default is 'User'.
#   # config.user_model_name = 'User'
#
#   # Define :current_user_method. Similar to previous option. It will be used
#   # to retrieve :user_model_name object if no `:to` option is given. Default
#   # is "current_#{user_model_name.downcase}".
#   # config.current_user_method = 'current_user'
# end
#
# # Create application badges (uses https://github.com/norman/ambry)
# # badge_id = 0
# # [{
# #   id: (badge_id = badge_id+1),
# #   name: 'just-registered'
# # }, {
# #   id: (badge_id = badge_id+1),
# #   name: 'best-unicorn',
# #   custom_fields: { category: 'fantasy' }
# # }].each do |attrs|
# #   Merit::Badge.create! attrs
# # end
# Merit::Badge.create!(
#   id: 1,
#   name: 'Golden Users',
#   description: "first 300 users of the site",
#   custom_fields: { image: 'merit-badges14.png' }
# )
# Merit::Badge.create!(
#   id: 2,
#   name: 'Engraved Glass',
#   description: "sent more than 50 messages",
#   custom_fields: { image: 'merit-badges2.png' }
# )
#
# Merit::Badge.create!(
#   id: 3,
#   name: 'Golf',
#   description: "sent more than 100 messages",
#   custom_fields: { image: 'merit-badges16.png' }
# )
# Merit::Badge.create!(
#   id: 4,
#   name: 'Stopwatch',
#   description: "made more than 10 comments",
#   custom_fields: { image: 'merit-badges4.png' }
# )
# Merit::Badge.create!(
#   id: 5,
#   name: 'Mike Sticker',
#   description: "made more than 50 comments",
#   custom_fields: { image: 'merit-badges10.png' }
# )
# Merit::Badge.create!(
#   id: 6,
#   name: 'Fox',
#   description: "made more than 100 comments",
#   custom_fields: { image: 'merit-badges1.png' }
# )
# Merit::Badge.create!(
#   id: 7,
#   name: 'Golden Golbet',
#   description: "made more than 200 comments",
#   custom_fields: { image: 'merit-badges9.png' }
# )
#
# Merit::Badge.create!(
#   id: 8,
#   name: 'Diamond Ring',
#   description: " made more than 50 micropost",
#   custom_fields: { image: 'merit-badges15.png' }
# )
#
# Merit::Badge.create!(
#   id: 9,
#   name: 'Crystal',
#   description: "made mo than 100 micropost",
#   custom_fields: { image: 'merit-badges11.png' }
# )
#
# Merit::Badge.create!(
#   id: 10,
#   name: 'Gold Glove',
#   description: " made more than 200 micropost",
#   custom_fields: { image: 'merit-badges18.png' }
# )
