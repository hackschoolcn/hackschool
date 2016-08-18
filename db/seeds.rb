
puts "这个seed会自动建立1个admin账号, 和2个user账号, 10个讨论组, 3个courses，3个chapters，5个posts。"

create_account = User.create([email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_user_accounts = for i in 1..2 do
	User.create!([email: "user#{i}@gmail.com", password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
end
	puts "2 user_accounts created."

create_questions = for i in 1..21 do
  Question.create!([title: "Question no.#{i}", description: "这是用seed建立的第 #{i} 个问题", user_id: "#{i}"])
end
  puts "21 Questions created by admins & users."

create_courses = for i in 1..3 do
  Course.create!([title: "Course no.#{i}"])
end
  puts "3 Courses created by admins."

create_chapters = for i in 1..3 do
  Chapter.create!([id: "#{i}", course_id: "1", title: "Chapter#{i}"])
end
  puts "3 Chapters of course_id[1] created by admins."

create_posts = for i in 1..5 do
  Post.create!([chapter_id: "1", title: "Post no.#{i}", description: "这是用seeds生成的第#{i}个post。"])
end
  puts "5 Posts of chapter_id[1] created by admins."
