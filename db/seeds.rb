puts "这个seed会自动建立11个admin账号, 和10个user账号, 10个讨论组"

create_account = User.create([email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_admin_accounts = for i in 1..10 do
  User.create!([email: "admin#{i}@gmail.com", password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
end
  puts "10 admin_accounts created."

create_user_accounts = for i in 1..10 do
    User.create!([email: "user#{i}@gmail.com", password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
end
    puts "10 user_accounts created."

create_groups = for i in 1..10 do
  Group.create!([title: "Group no.#{i}", description: "这是用seed建立的第 #{i} 个产品"])
end
  puts "10 Groups created."
