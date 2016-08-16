puts "这个seed会自动建立1个admin账号, 和2个user账号"

create_account = User.create([email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([email: 'admin2@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin2 account created."

create_account = User.create([email: 'user1@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "user1 account created."

create_account = User.create([email: 'user2@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "user2 account created."
