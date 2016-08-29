
puts "这个seed会自动建立1个admin账号, 10个user账号, 7个 Chapters，和相应的小节 Posts, 10个admin创建的questions，10个user创建的questions，"

# Create Admin Account
User.create([username: "admin", email: "admin@gmail.com", password: "123456", password_confirmation: "123456", is_admin: "true"])
puts "Admin account created."

# Create Account
for i in 1..10 do
  User.create([username: "user#{i}", email: "user#{i}@gmail.com", password: "123456", password_confirmation: "123456"])

end
puts "10 User accounts created."

# Create Course

Course.create([title: "Rails 基础环境建设", one_sentence_summary: "准备必要的工具和软件，配置 Rails 开发环境", teacher_name: "xdite", is_hidden: false, price: 100])
puts "1st Course created."

Course.create([title: "出发前的热身", one_sentence_summary: "速度和压力练习，训练你在10小时之内做出 KnewOne 剁手网站", teacher_name: "xdite", is_hidden: false, price: 1000])
puts "2nd Course created."

Course.create([title: "游戏，但这不是游戏", one_sentence_summary: "完整的网页端多人合作游戏开发 - 没热身的请绕道", teacher_name: "xdite", is_hidden: false, price: 2000])
puts "3rd Course created."

Course.create([title: "速度的极限和极限的速度", one_sentence_summary: "搭建直播平台，训练解决复杂网络环境下网速问题的能力", teacher_name: "xdite", is_hidden: false, price: 2000])
puts "3rd Course created."

# Create Chapter
Chapter.create([chapter: "第一章 开始之前", course_id: "1"])
puts "生成第一章"

# Create Post
Post.create([course_id: "1", chapter_id: "1", title: "购买电脑（Mac 电脑）", article: "## 购买电脑（Mac 电脑）\r\n\r\n因为这个课程使用的基础设备是 Mac 电脑。所以接下来的整个教程都是以 Mac 为基础的教学课程。\r\n\r\n所以请在开学之前，确保你自己已经购买了一台 Mac 电脑，并且把 Rails 开发环境搭建完毕。\r\n\r\n---\r\n\r\n### Mac 电脑的最低需求\r\n为了确保开发过程的流畅。我们建议你购买以下的电脑配置\r\n*  2014年以后出厂的 Macbook Air/Macbook Pro\r\n*  屏幕限制 13\"以上，最好是 15\"+\r\n*  内存限制 8GB 以上，最好是 16GB\r\n*  操作系统限制 OSX 10.10 以上，最好是 10.11\r\n\r\n", is_hidden: false])
puts "生成第一章第 1 节"

Task.create([course_id: 1, post_id: 1, due_time: Time.zone.now + 1.month, description: "请把你的电脑型号贴在这里\r\n\r\n\r\n\r\n请将你的电脑规格截图贴上来\r\n\r\n点击选择左上角苹果图案，选择第一项 “关于这台电脑”\r\n\r\n将你的电脑规格截图（ command + shift + 4 ，选取画面，截图会自动存在您的桌面上）\r\n\r\n将图片拖曳到回答栏位，即可上传图片"])
puts "生成作业 - 第一章第 1 节"

Post.create([course_id: "1", chapter_id: "1", title: "加入课程 Slack 频道（学会翻墙交流技能）", article: "## 加入课程 Slack 频道（学会翻墙交流技能）\r\n这个课程的官方交流频道在 Slack 上：\r\n* 请各位同学到 https://growthschool-slack.herokuapp.com/ 上注册一个 slack 账号。\r\n* 加入 channel：#rails-fullstack-1\r\n\r\n### Slack\r\n![](http://imageshack.com/a/img922/9831/dLTfz0.png)\r\n[slack](https://slack.com) 是一套即时通讯系统。台湾地区敏捷团队多半使用此套即时通讯系统，作为团队内部的信息交流使用。我们在这套课程里，也会使用这一套工具交流学习以及协作开发。\r\n\r\n### Slack 被挡了怎么办？（Only for 大陆学员）\r\n程序员寻找的很多资源都在墙以外的世界。你可以使用\r\n\r\n* [云梯](https://yuntidata.com/)\r\n\r\n之类的服务，翻墙出去，这样就可以使用 Slack App了。\r\n", is_hidden: false])
puts "生成第一章第 2 节"

Task.create([course_id: 1, post_id: 2, due_time: Time.zone.now + 1.month, description: "\r\n这个课程官方交流频道在 Slack 上：\r\n\r\n* 请各位同学到 [https://growthschool-slack.herokuapp.com/](https://growthschool-slack.herokuapp.com/) 上注册一个 slack 账号\r\n\r\n- 加入 channel ：#rails-fullstack-1 和 #rails-newbie\r\n\r\n并在这里缴交你的 slack id 与真名"])
puts "生成作业 - 第一章第 2 节"

# Create Chapter

Chapter.create([chapter: "第二章 安装开发环境", course_id: "1"])
puts "生成第二章"

Post.create([course_id: "1", chapter_id: "2", title: "确认操作系统", article: "## 确认操作系统\r\n请确认您的 Mac 操作系统是 10.10（Yosemite）以上\r\n\r\n![](http://imageshack.com/a/img921/2962/4TiK2e.png)\r\n\r\n![](http://imageshack.com/a/img922/1942/RYCC45.png)\r\n\r\n", is_hidden: false])
puts "生成第二章第 1 节"

Post.create([course_id: "1", chapter_id: "2", title: "安装 Xcode", article: "## 安装 Xcode\r\n\r\n![](http://imageshack.com/a/img924/4168/fmGknS.png)\r\n\r\n找到 Xcode 并点击安装\r\n\r\n![](http://imageshack.com/a/img921/4756/B3qJtd.png)\r\n\r\n#### 首次执行，同意协议\r\n\r\n安装过程大约需要2~3小时，安装时间可能会受到您的网路速度的影响。\r\n\r\n\r\n\r\n安装 Xcode 完毕，在桌面左下角找到 Launchpad，并点击打开\r\n\r\n![](http://imageshack.com/a/img922/8080/esf9mZ.png)\r\n\r\n\r\n\r\n找到 Xcode，并打开执行\r\n\r\n![](http://imageshack.com/a/img924/7701/6ggS6N.png)\r\n\r\n\r\n\r\n首次执行， Xcode会要求同意”使用者协议“，选择 Agree\r\n\r\n![](http://imageshack.com/a/img924/361/yaJHST.png)\r\n\r\n\r\n\r\n若 Xcode 要求执行权限，请输入您的电脑开机密码，并同意。\r\n\r\n![](http://imageshack.com/a/img921/6753/7YWGuI.png)\r\n\r\n", is_hidden: false])
puts "生成第二章第 2 节"

Task.create([course_id: 1, post_id: 4, due_time: Time.zone.now + 1.month, description: "\r\n安装完成后请输入 “ok”\r\n\r\n点击选择 Submit"])
puts "生成作业 - 第二章第 2 节"

Post.create([course_id: "1", chapter_id: "2", title: "确认安装 Command Line Tools", article: "## 确认安装 Command Line Tools\r\n\r\n到 Mac 的 Spotlight\r\n\r\n![](http://imageshack.com/a/img924/6691/3NIOt3.png)\r\n\r\n搜索 Terminal\r\n\r\n![](http://imageshack.com/a/img921/1157/BY3ZwP.png)\r\n\r\n打开你的 “Terminal” 程式。（以后我们都会透过这个程式来输入程序指令）\r\n\r\n\r\n\r\n##### 在窗口里输入指令：\r\n\r\n`xcode-select --install`\r\n\r\n它将会安装 command line tools（这是安装 Ruby 所需要的 Library）\r\n\r\n执行后会出现这个窗口，点击“安装”这个按钮进行安装。\r\n\r\n![](http://imageshack.com/a/img921/5334/XG7pwF.png)\r\n\r\n\r\n\r\n### 如何确定是否已经安装好？\r\n\r\n***\r\n\r\n在 Terminal 窗口中输入：\r\n\r\n`xcode-select -p`\r\n\r\n显示出：/Library/Developer/CommandLineTools\r\n\r\n即表示已经安装成功！", is_hidden: false])
puts "生成第二章第 3 节"

Post.create([course_id: "1", chapter_id: "2", title: "确认安装 Homebrew", article: "## 确认安装 Homebrew\r\n\r\n#### Homebrew 简介\r\n\r\n***\r\n\r\nHomebrew 是开发者社群专门为 MacOSX 打造的第三方套件管理程式，比如说安装 Ruby 需要一些编译工具或函式库，这些工具或函式库，可以从 Homebrew 取得。\r\n\r\nHomebrew 的官方网址是：http://brew.sh/index_zh-tw.html\r\n\r\n![](http://imageshack.com/a/img923/3668/8x9ASa.png)\r\n\r\n\r\n\r\n#### 如何安装 Homebrew ？\r\n\r\n***\r\n\r\n在终端机输入：（若以下指令失效，可以到官方网址查看最新版）\r\n\r\n`/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"`\r\n\r\n\r\n\r\n发现在使用 Homebrew 之前，需要先同意 Xcode 的使用者规范\r\n\r\n![](http://imageshack.com/a/img921/1339/FMiH4B.png)\r\n\r\n输入：`sudo xcodebuild -license`  同意。\r\n\r\n* 中间会出现很多条文，一直按 “空白键” 拖到最下页，然后输入 agree 同意。", is_hidden: false])
puts "生成第二章第 4 节"

Task.create([course_id: 1, post_id: 6, due_time: Time.zone.now + 1.month, description: "安装完成后请输入 “ok”\r\n\r\n点击选择 Submit"])
puts "生成作业 - 第二章第 4 节"

Post.create([course_id: "1", chapter_id: "2", title: "在 Homebrew 安装 git", article: "## 在 Homebrew 安装 git\r\n\r\n#### Git 简介\r\n\r\n***\r\n\r\nGit 是目前最流行的原始码控制软件。你可以把 Git 想象成是程式码的时光备份机器。\r\n\r\n\r\n\r\n#### 安装 Git\r\n\r\n***\r\n\r\n使用 Homebrew 安装 Git\r\n\r\n在 Terminal 窗口中输入：\r\n\r\n`brew install git`\r\n\r\n", is_hidden: false])
puts "生成第二章第 5 节"

Task.create([course_id: 1, post_id: 7, due_time: Time.zone.now + 1.month, description: "\r\n请输入\r\n\r\ngit —version\r\n\r\n贴出你的 git 版本号"])
puts "生成作业 - 第二章第 5 节"

Post.create([course_id: "1", chapter_id: "2", title: "安装 ImageMagick", article: "## 安装 ImageMagick\r\n\r\n#### ImageMagick 简介\r\n\r\n***\r\n\r\nImageMagick 是专门处理图片的函式库。以后我们在用 Ruby 的时候会常常需要使用 ImageMagick 相关的功能，所以通常在初期建置环境时，我们也会安装ImageMagick。\r\n\r\n\r\n\r\n#### 安装 ImageMagick\r\n\r\n***\r\n\r\n`brew install imagemagick`\r\n\r\n", is_hidden: false])
puts "生成第二章第 6 节"

Post.create([course_id: "1", chapter_id: "2", title: "安装 PostgresSQL", article: "## 安装 PostgresSQL\r\n\r\n#### PostgresSQL 简介\r\n\r\n***\r\n\r\nPostgresSQL 是一套强大的资料库。许多网站开发预设使用 PostgresSQL 作为底层资料库。在初期建置环境时，我们也会安装 PostgresSQL。\r\n\r\n\r\n\r\n#### 安装 PostgresSQL\r\n\r\n***\r\n\r\n`brew install postgresql`\r\n\r\n安装完毕后：\r\n\r\n`brew services start postgresql` （确保在你下次开机时，也会一起启动资料库）\r\n\r\n", is_hidden: false])
puts "生成第二章第 7 节"

Task.create([course_id: 1, post_id: 9, due_time: Time.zone.now + 1.month, description: "请输入 postgres -V\r\n\r\n贴出你的版本号"])
puts "生成作业 - 第二章第 7 节"

Post.create([course_id: "1", chapter_id: "2", title: "确认安装 RVM", article: "## 确认安装 RVM\r\n\r\n#### RVM 简介\r\n\r\n***\r\n\r\n在 Mac 开发 Ruby on Rails 程式时，因为 Ruby 版本更新很快，常常会遇到一些版本与权限上的问题。所以，在开发时，我们通常不会使用系统内建的 Ruby。而是会采用一套 Ruby Version Manager 去管理 Ruby 的安装与升级。透过 Ruby Version Manager（RVM）去安装 Ruby。\r\n\r\n\r\n\r\n#### 安装 RVM\r\n\r\n***\r\n\r\nRVM 的官方网址是 [http://rvm.io](http://rvm.io/)\r\n\r\n官方网站提供的安装指令是：\r\n\r\n`\\curl -L https://get.rvm.io | bash -s stable`\r\n\r\n安装完输入：\r\n\r\n`source ~/.rvm/scripts/rvm`\r\n\r\n让 ram 生效。\r\n\r\n然后安装一个套件\r\n\r\n`brew install libxml2`\r\n\r\n\r\n\r\n", is_hidden: false])
puts "生成第二章第 8 节"

Post.create([course_id: "1", chapter_id: "2", title: "确认安装 Ruby", article: "## 确认安装 Ruby\r\n\r\n#### 安装 Ruby\r\n\r\n***\r\n\r\n`rvm install 2.3.1` <== 尾端可选择自己需要的版本 EX: 1.9.3 , 2.1.2 ... etc\r\n\r\n`rvm use 2.3.1 --default` 使用 ruby 2.3.1 为预设版本 (可改成自己需要的版本)\r\n\r\n安装完以后记得重开 terminal。\r\n\r\n`rvm list` 列出目前已安装的 Ruby 版本。\r\n\r\n\r\n\r\n#### 指定 RubyGems 来源（参考：如果你人在大陆，无法连上时再使用这个方法）\r\n\r\n***\r\n\r\n如果遇到不太连得上  [https://rubygems.org](https://rubygems.org/) 的时候，可以多执行一行指令：\r\n\r\n`gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/`", is_hidden: false])
puts "生成第二章第 9 节"

Task.create([course_id: 1, post_id: 11, due_time: Time.zone.now + 1.month, description: "请输入 ruby -v 并贴出版本号"])
puts "生成作业 - 第二章第 9 节"

Post.create([course_id: "1", chapter_id: "2", title: "确认安装 Rails", article: "## 确认安装 Rails\r\n\r\n#### 安装 Rails\r\n\r\n***\r\n\r\n（建议你在连上 vpn 的状态下操作。因为墙会挡掉 rubygems.org 的）\r\n\r\n`gem install rails -v 5.0.0`\r\n\r\n后面的参数是指定版本，预设会抓取最新的版本\r\n\r\n", is_hidden: false])
puts "生成第二章第 10 节"

Task.create([course_id: 1, post_id: 12, due_time: Time.zone.now + 1.month, description: "请输入 rails -v 并贴出版本号"])
puts "生成作业 - 第二章第 10 节"

# Create Chapter

Chapter.create([chapter: "第三章 设置 编辑器 & Terminal & Shell", course_id: "1"])
puts "生成第三章"

Post.create([course_id: "1", chapter_id: "3", title: "Atom / Sublime", article: "## Atom / Sublime\r\n\r\n在编程的时候，除了需要输入指令之外，我们还需要能够编辑程序的软件。\r\n\r\n目前市面上有许多不同的 Rails 编辑器，\r\n\r\n在这里我们推荐给新手的有两款，可以选择其中一款来安装：\r\n\r\n#### Atom\r\n\r\n***\r\n\r\n这款是由 Github 维护的 [http://atom.io](http://atom.io/)\r\n\r\n![](http://imageshack.com/a/img923/5331/Fx934a.png)\r\n\r\n下载后，解压，将 atom 拖拉到 “应用程式” 即可。\r\n\r\n\r\n\r\n#### Sublime\r\n\r\n***\r\n\r\n这款是独立开发者所维护的 [https://www.sublimetext.com/](https://www.sublimetext.com/)\r\n\r\n下载后，双击 Sublime 打开 dmg\r\n\r\n![](http://imageshack.com/a/img922/5600/j4dgCs.png)\r\n\r\n\r\n\r\n将 Sublime 拖到应用程式即可\r\n\r\n![](http://imageshack.com/a/img923/1760/aLaZq1.png)", is_hidden: false])
puts "生成第三章第 1 节"

Post.create([course_id: "1", chapter_id: "3", title: "设定在 Terminal 内可以打开 Atom 与 Sublime", article: "## 设定在 Terminal 内可以打开 Atom 与 Sublime\r\n\r\n如何在 Terminal 内可以 “用惯用的编辑器” 快速打开 “目前正在做” 的专案（project）呢？\r\n\r\n这个功能叫 Shell commands 。这个功能可以帮助你在最短的时间内，开启正在执行的项目程序码档案。\r\n\r\nAtom 内开启这个功能的选项，在左上角的下拉选单里：\r\n\r\n#### Atom 版本\r\n\r\n***\r\n\r\n![](http://imageshack.com/a/img924/3503/f6C7QS.png)\r\n\r\n\r\n\r\n#### Sublime 版本\r\n\r\n***\r\n\r\n`sudo ln -s \"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl\" /usr/local/bin/subl`\r\n\r\n（需要输入密码）\r\n\r\n以后当我们在制作一个新的专案（project）的时候，就可以透过在 Terminal 输入指令，让 Atom 或 Sublime 自动打开相对应的资料夹。", is_hidden: false])
puts "生成第三章第 2 节"

# Create Chapter

Chapter.create([chapter: "第四章 体验 Rails", course_id: "1"])
puts "生成第四章"

Post.create([course_id: "1", chapter_id: "4", title: "体验：建立一个 Rails 专案", article: "## 体验：建立一个 Rails 专案\r\n\r\n前面章节的安装步骤做完后，我们就已经可以建立一个 Rails 专案并操作。由于只用 Mac 原始内建的工具来开发，所以非常的一般，使用起来不是很方便。\r\n\r\n本章的目的是让您可以马上体验建立一个 Rails 专案并且可以在浏览器上打开操作。\r\n\r\n（建议你在连上 vpn 的状态下操作。因为墙会挡掉 rubygems.org 的）\r\n\r\n我们仍然需要后面的步骤把开发工具跟第三方服务安装完，才能帮助您使用更方便、快速、有效的方式开发。\r\n\r\n#### 开启终端机，建立一个新的 Rails 专案\r\n\r\n***\r\n\r\n![](http://imageshack.com/a/img922/9268/VeNthi.png)\r\n\r\n\r\n\r\n输入 `ruby -v`, `rails -v` 确认版本\r\n\r\n![](http://imageshack.com/a/img922/3820/GK1K6b.png)\r\n\r\n\r\n\r\n输入 `rails new first_app` 建立一个新的 rails 专案。\r\n\r\n![](http://imageshack.com/a/img921/7919/nvQYyO.png)\r\n\r\n\r\n\r\n……（中间会跑很多信息）\r\n\r\n![](http://imageshack.com/a/img923/5909/H8CMGQ.png)\r\n\r\n\r\n\r\n（如果中间卡住）\r\n\r\n***\r\n\r\n大陆的朋友，如果中间卡住，请打开 ffirst_app 下的 `Gemfile`，将  `https://rubygems.org`  改成 `http://ruby.taobao.org`\r\n\r\n然后在 `first_app` 下跑 `bundle install`。\r\n\r\n一个新的 Rails 专案就建立完成了！\r\n\r\n", is_hidden: false])
puts "生成第四章第 1 节"

Post.create([course_id: "1", chapter_id: "4", title: "进入 Rails 专案，并执行 server 环境运作", article: "## 进入 Rails 专案，并执行 server 环境运作\r\n\r\n输入 `cd first_app` 进入刚建立好的资料夹\r\n\r\n可以输入 `pwd` 确认所在的位置路径，以及输入 `ls` 确认目前资料夹的內容\r\n\r\n![](http://imageshack.com/a/img922/8496/xK1WzV.png)\r\n\r\n\r\n\r\n输入  `rails s` 即可启动 server 模式\r\n\r\n![](http://imageshack.com/a/img923/3534/QTzHlb.png)\r\n\r\n\r\n\r\n前往 [http://localhost:3000/](http://localhost:3000/) 即可进入 Rails 的画面\r\n\r\n![](http://imageshack.com/a/img923/7372/MkxYz7.png)\r\n\r\n", is_hidden: false])
puts "生成第四章第 2 节"

Post.create([course_id: "1", chapter_id: "4", title: "建立一个简单的留言板功能", article: "## 建立一个简单的留言板功能\r\n\r\n这只是个刚建好的空专案，我们可以加点功能来体验 Rails 的开发\r\n\r\n首先，再开一个新的终端机窗口（快捷键： ⌘ + N）\r\n\r\n* `cd first_app` 进入到 first_app 的资料夹\r\n\r\n\r\n* `ls`  确认目前资料夹位置的档案结构\r\n\r\n![](http://imageshack.com/a/img924/7452/rYvRKZ.png)\r\n\r\n这时候会有两个窗口，一个放着跑 rails s，一个继续做指令操作来开发。到做开发的窗口下输入：\r\n\r\n`rails g scaffold topic title:string description:text`\r\n\r\n![](http://imageshack.com/a/img924/2668/MZ1rkb.png)\r\n\r\n跑 `rake db:migrate`\r\n\r\n![](http://imageshack.com/a/img924/9233/JHbLgN.png)\r\n\r\n\r\n\r\n#### 体验刚建好的留言板功能\r\n\r\n***\r\n\r\n前往 [http://localhost:3000/topics](http://localhost:3000/topics)\r\n\r\n体验留言板功能吧！\r\n\r\n![](http://imageshack.com/a/img922/2607/Xkb381.png)\r\n\r\n\r\n\r\n![](http://imageshack.com/a/img921/4327/y6vJfO.png)\r\n\r\n\r\n\r\n![](http://imageshack.com/a/img921/3642/ceaSFR.png)\r\n\r\n\r\n\r\n", is_hidden: false])
puts "生成第四章第 3 节"

Task.create([course_id: 1, post_id: 17, due_time: Time.zone.now + 1.month, description: "请将你的实际作品画面 贴到 答案里（将截图拉倒对话框即可上传）"])
puts "生成作业 - 第四章第 3 节"

Chapter.create([chapter: "第五章 体验 Git", course_id: "1"])
puts "生成第五章"

Post.create([course_id: "1", chapter_id: "5", title: "Git 基本指令", article: "## Git 基本指令\r\n\r\n这章我们会教大家几个基本的指令：\r\n\r\n* git config\r\n* git init\r\n* git add\r\n* git status\r\n\r\n\r\n\r\n#### What is Git ?\r\n\r\n***\r\n\r\nGit 是 Linux 之父 Linus Torvalds 开发出来的一套程式码版本控制系统。你可以把 git 想象成玩游戏时存档的工具。每当程式开发到一定的段落，就使用 git 存档一下。\r\n\r\n在这章我们不会覆盖到许多困难的 git 指令，只会 讲解必要的指令。\r\n\r\n\r\n\r\n##### git config\r\n\r\n***\r\n\r\n就像是首次玩游戏时一样，你必须设定游戏玩家角色叫什么。这里我们必须要设定两个参数：\r\n\r\n`git config --global user.name \"Jone Doe\"`\r\n`git config --global user.email johndoe@example.com`\r\n\r\n这样以后进行存档时，就会记录你是这次进度的存档者。\r\n\r\n\r\n\r\n##### git init\r\n\r\n***\r\n\r\n`git init` 初次设定进度储存库\r\n\r\n![](http://imageshack.com/a/img922/5797/LW5dE6.png)\r\n\r\n\r\n\r\n##### git add & git status\r\n\r\n***\r\n\r\n输入 `git add README.md`，再输入 `git status`\r\n\r\n![](http://imageshack.com/a/img923/4529/oP0M8J.png)\r\n\r\n你会发现 `README.md` 变成绿色，其余的档案还是红色。这表示我们已经预备将 `README.md` 「设定为预备储存进度的档案」。\r\n\r\n\r\n\r\n##### git commit\r\n\r\n***\r\n\r\n输入 `git commit -m \"add README\"` 真正将这个档案存进了进度区里。\r\n\r\n![](http://imageshack.com/a/img923/2643/LHcLH0.png)\r\n\r\n\r\n\r\n接着我们再输入一遍 `git status`，发现还是有很多档案，没有被存进进度区里。\r\n\r\n![](http://imageshack.com/a/img922/7776/rtk05M.png)\r\n\r\n\r\n\r\n所以这次我们也要将剩下的档案全都存进进度区里。\r\n\r\n输入 `git add .`，这样就可以把这个目录夹下 “所有还没有被加入 git 历史资料库的档案” 设为 “预备储存” 的状态。然后输入 `git commit -m \"add rest files\"` 储存剩下所有的档案。\r\n\r\n![](http://imageshack.com/a/img921/7889/GuL91s.png)\r\n\r\n", is_hidden: false])
puts "生成第五章第 1 节"

Post.create([course_id: "1", chapter_id: "5", title: "将 project 上传到 Github - (1) 设定 Github 账号", article: "## 将 project 上传到 Github - (1) 设定 Github 账号\r\n\r\nGithub 是 Opensource 社群中，重要的资源集散地。几乎人人都有一个账号，几乎是强制必备。请在此注册一个账号。\r\n\r\n[http://github.com](http://github.com/)\r\n\r\n\r\n\r\n#### 在 Github 上设定自己的电子签章\r\n\r\n***\r\n\r\n你可以这样想象，每一台笔记本电脑都有自己的电子签章，它就是你的 SSH Key。而 SSH Public Key 你可以想象成是在银行 ( Github）留的印章卡，去银行办事时，跟你的私有 Key 一对，就能确定这是你本人。\r\n\r\n所以在这里我们要进行一个在 Github 留印章卡的动作\r\n\r\n###### 步骤1\r\n\r\n***\r\n\r\n在 Terminal 先输入 `more ~/.ssh/id_rsa.pub` 看看有沒有东西。\r\n\r\n![](http://imageshack.com/a/img923/1329/n1tsR9.png)\r\n\r\n* 有的话 copy 整个内容，到步骤 3\r\n* 没有的话到步骤 2\r\n\r\n###### 步骤 2\r\n\r\n***\r\n\r\n如果沒有 id_rsa.pub 这个档案，请输入 `ssh-keygen` 连按三个 enter\r\n\r\n![](http://imageshack.com/a/img921/8559/UzyYdr.png)\r\n\r\n然后再输入一次 `more ~/.ssh/id_rsa.pub` ，把出来的内容 copy 起来\r\n\r\n\r\n\r\n###### 步骤 3\r\n\r\n***\r\n\r\n前往 [https://github.com/settings/ssh](https://github.com/settings/ssh)\r\n\r\n![](http://imageshack.com/a/img922/8035/HmoQXh.png)\r\n\r\n![](http://imageshack.com/a/img924/3844/cuq8MN.png)\r\n\r\n![](http://imageshack.com/a/img921/1210/9q4BEg.png)\r\n\r\n", is_hidden: false])
puts "生成第五章第 2 节"

Task.create([course_id: 1, post_id: 19, due_time: Time.zone.now + 1.month, description: "请留下你的 github 账号"])
puts "生成作业 - 第五章第 2 节"

Post.create([course_id: "1", chapter_id: "5", title: "将 project 上传到 Github - (2) 在 Github 上建立专案并上传程式码", article: "## 将 project 上传到 Github - (2) 在 Github 上建立专案并上传程式码\r\n\r\n#### 建立新 Project\r\n\r\n***\r\n\r\n假设你拥有一个全新的 Github 账号。你的 Github 首页会只出现两个选项。按下 “Start a project” 新增一个专案。\r\n\r\n![](http://imageshack.com/a/img922/1310/HFxGgt.png)\r\n\r\n选好你要的名字建立专案。这里我们使用 first_app\r\n\r\n![](http://imageshack.com/a/img923/5272/X6GIdR.png)\r\n\r\n建立以后，Github 会出现两个选项。一个是你复制 github 的空专案，重新来过。一个是你汇入现有的专案。而因为我们之前已经在本机里面有一个 git 专案了。所以我们选择选项 2。\r\n\r\n![](http://imageshack.com/a/img924/7407/W7yvgr.png)\r\n\r\n\r\n\r\n#### 上传专案\r\n\r\n***\r\n\r\n接着我们将 Github 好心帮我们准备的两行指令，贴到 Terminal 里面去。\r\n\r\n`git remote add origin git@github.com:xxddite/first_app.git` ( 这边改成 Github 提供给你的网址）\r\n`git push -u origin master`\r\n\r\n![](http://imageshack.com/a/img924/5660/sOYuIG.png)\r\n\r\n这样就完成了上传的动作。\r\n\r\n接着到我们刚刚设立的专案网址：[https://github.com/xxddite/first_app](https://github.com/xxddite/first_app)。 (这边改成 Github 提供给你的网址）\r\n\r\n这样就看到了我们刚刚上传的程式码。\r\n\r\n![](http://imageshack.com/a/img921/5408/MWybx1.png)\r\n\r\n", is_hidden: false])
puts "生成第五章第 3 节"

Task.create([course_id: 1, post_id: 20, due_time: Time.zone.now + 1.month, description: "请贴 github 网址"])
puts "生成作业 - 第五章第 3 节"

Post.create([course_id: "1", chapter_id: "5", title: "持续开发新功能并且上传到 Github", article: "## 持续开发新功能并且上传到 Github\r\n\r\n以后要如何持续开发新功能并且上传到 Github 呢？\r\n\r\n其实在这个阶段，你只要持续做 3 个功能，就行了。\r\n\r\n* `git add [档案名称]` （单个档案） 或 `git add .` （全部档案）\r\n* `git commit -m \"这次存档的信息\"`\r\n* `git push origin master` （上传到 github）\r\n\r\n就可以持续把进度同步到 Github。", is_hidden: false])
puts "生成第五章第 4 节"

# Create Chapter
Chapter.create([chapter: "第六章 上传专案到 Heroku", course_id: "1"])
puts "生成第六章"

Post.create([course_id: "1", chapter_id: "6", title: "注册 Heroku 账号", article: "## 注册 Heroku 账号\r\n\r\n#### Heroku\r\n\r\n***\r\n\r\n我们所有的编程工作都是在自己的电脑上完成，所以只能在自己的浏览器上看到成果，如果想要让网站公开给大家看，就必须将它放到服务器上，这个把做好的网站安放到稳定的服务器上的动作，就叫部署（depoly）。\r\n\r\nHeroku 是 Rails 社群中，最方便的网站部署工具。如果你开发了小型的网站，Heroku 提供了非常便利的部署工具。（用 Git 上传就能部署）。在这里我们也要请各位先注册一个 Heroku 账号。\r\n\r\n[http://heroku.com](http://heroku.com/)\r\n\r\n\r\n\r\n#### Heroku Belt\r\n\r\n***\r\n\r\nHeroku Toolbelt 是 Heroku 所推出的环境命令工具包。请前往 [https://toolbelt.heroku.com/](https://toolbelt.heroku.com/) 安装。\r\n\r\n\r\n\r\n#### 完成 Heroku 的 SSH-key 的设定\r\n\r\n***\r\n\r\n先输入 `heroku login` 确认是否已经登入\r\n\r\n再输入 `heroic keys:add` 即可", is_hidden: false])
puts "生成第六章第 1 节"

Post.create([course_id: "1", chapter_id: "6", title: "上传专案到 Heroku", article: "## 上传专案到 Heroku\r\n\r\n#### 第一次 deploy 的方法\r\n\r\n***\r\n\r\n##### 步骤 1：开一个新的 Heroku 应用程式\r\n\r\n***\r\n\r\n在终端机打这些字：\r\n\r\n`heroku create`\r\n\r\n`heroku create` 会在 Heroku 的系统里面注册新的应用程式。跑完之后你应该会看到输出里面告诉你新的应用程式的 URL。\r\n\r\n![](http://imageshack.com/a/img921/4691/bRjV6r.png)\r\n\r\n\r\n\r\n然后 `git push heroku master`\r\n\r\n![](http://imageshack.com/a/img922/8871/ATSxaq.png)\r\n\r\n\r\n\r\n提示开发者并没有安装 sqlite3 。\r\n\r\n![](http://imageshack.com/a/img923/6329/31fEO8.png)\r\n\r\n\r\n\r\n这时候请千万不要傻傻的安装 sqlite3 。\r\n\r\nHeroku 的正式环境里，资料库其实并不支持 sqlite3，而是有自定义的资料库 pg。不过关于这段的解释太专业了，初入门的朋友可能看不懂，我们这里只先谈：如何绕过这个错误信息，让你的网站可以顺利部署上 Heroku。\r\n\r\n\r\n\r\n##### 步骤 2：修改 Gemfile\r\n\r\n***\r\n\r\n* 安装Atom的朋友，请在编辑器输入：`cd first＿app`， 按[enter]\r\n\r\n* 输入：`atom .`  ，按[enter]  就可以成功开启专案的档案群\r\n\r\n* 安装 Sublime的朋友，请在编辑器输入：`cd first＿app` 按[enter]\r\n\r\n* 输入：`subl .` ，按[enter]  就可以成功开启专案的档案群\r\n\r\n  ​\r\n\r\n在编辑器里打开 `Gemfile`  这个档案，将第 7 行的`gem 'sqlite3'` 剪下\r\n\r\n![](http://imageshack.com/a/img922/1032/EY3ixt.png)\r\n\r\n\r\n\r\n把 sqlite3 搬到大约第 30 行的这个 group 里面。\r\n\r\n![](http://imageshack.com/a/img921/8673/swvTLY.png)\r\n\r\n\r\n\r\n然后在大约第 47 行新增一个 production group，加上 pg 这个 gem\r\n\r\n![](http://imageshack.com/a/img923/3746/iRZwk7.png)\r\n\r\n存档。（按 command+s）\r\n\r\n\r\n\r\n##### 步骤 3：套用 Gemfile 的异动\r\n\r\n***\r\n\r\n然后在终端机里执行这条指令\r\n\r\n- `bundle install`\r\n\r\n每当你改 Gemfile 的時候，你都要跑一次 `bundle install`，这样子异动才会被套用。套用之后的异动会被存在另一个档案 `Gemfile.lock`。\r\n\r\n\r\n\r\n##### 步骤 4：把 Gemfile 的异动 commit 到 git\r\n\r\n***\r\n\r\n* `git add Gemfile`\r\n* `git add Gemfile.lock`\r\n* `git commit -m \"move sqlite3 to dev group & add pg to production group \"`\r\n\r\n\r\n\r\n##### 步骤5：上传到 Heroku\r\n\r\n***\r\n\r\n* `git push heroku master`\r\n\r\n![](http://imageshack.com/a/img923/6925/ELsm4u.png)\r\n\r\n![](http://imageshack.com/a/img923/4381/xhBO1o.png)\r\n\r\n\r\n\r\n#### 设定根目录\r\n\r\n***\r\n\r\n然后我们可以用 `heroku open` 打开网站。\r\n\r\n不过映入眼帘的却是：\r\n\r\n![](http://imageshack.com/a/img921/1000/SLWhy7.png)\r\n\r\n这是因为我们没有在 `config/routes.rb` 下设定首页。\r\n\r\n\r\n\r\n![](http://imageshack.com/a/img923/4397/0OaeRL.png)\r\n\r\n在第 3 行加入：\r\n\r\n`root \"topics#index\"` 让首页根目录指到 topics 的 index 那一页。\r\n\r\n之后我们再执行：\r\n\r\n* `git add . `\r\n* `git commit -m \"add root path\"`\r\n\r\n![](http://imageshack.com/a/img921/2129/MswxIy.png)\r\n\r\n再执行：\r\n\r\n* `git push heroku master`\r\n* `heroku open`\r\n\r\n映入眼帘的还是错误信息，只是这次变成：We're sorry, but something went wrong.\r\n\r\n![](http://imageshack.com/a/img922/3750/F2kP5n.png)\r\n\r\n\r\n\r\n我们可以使用 `heroku logs` ，观看 heroku 上的错误：\r\n\r\n![](http://imageshack.com/a/img924/5931/LR6mda.png)\r\n\r\n发现错误的信息在于 heroku 上面的 topics 资料库栏位，似乎并不存在。\r\n\r\n原来我们忘记跑了一个指令叫： `heroku run rake db:migrate`\r\n\r\n![](http://imageshack.com/a/img923/499/39TJxA.png)\r\n\r\n\r\n\r\n跑完再 `heroku open` ，看到这个画面，就表示一切顺利运行了。恭喜你，你有了第一个可以在公开空间上运行的论坛App！\r\n\r\n![](http://imageshack.com/a/img924/8867/gQdgEC.png)\r\n\r\n\r\n\r\n#### deploy 新版程式的方法\r\n\r\n***\r\n\r\n##### 步骤 1：把所有异动动 commit 到 git\r\n\r\n***\r\n\r\nHeroku 只受理我们有 commit 进本地 git repo 的程式，所以要确定修改过的档案都有 commit 进去了。\r\n\r\n在终端机输入这些字：\r\n\r\n`git status`\r\n\r\n`git status` 显示你还没 commit 进 git 的异动。如果没有输出任何东西的话，那你可以 deploy 了！不然的话就要 commit 程式码进去：\r\n\r\n在终端机输入这些字：\r\n\r\n`git add . `\r\n\r\n`git commit -m \"Some helpful message for your future self\"`\r\n\r\nCommit message 应该要可以描述你这次修改了什么东西，像是：“把投票数加到 topics 列表页”\r\n\r\n\r\n\r\n##### 步骤 2：把异动 push（上传）到 Heroku\r\n\r\n***\r\n\r\n在终端机输入这些字：\r\n\r\n`git push heroku master`\r\n\r\n这样子会把本地所有已经 commit 进去的异动都 push 到 Heroku。\r\n\r\n\r\n\r\n##### 步骤 3：在 Heroku 跑资料库的 migration\r\n\r\n***\r\n\r\n在终端机输入这些字：\r\n\r\n`heroku run rake db:migrate`\r\n\r\n这是叫 Heroku 在它的资料库跑 migration ，作用就像我们在本地跑 rake db:migrate。\r\n\r\nHeroku 的资料库跟你电脑上的资料库是分开的，也就是说每一次你更改了资料库的结构，你都要在 Heroku 的资料库更新一次。这也就是说在 Heroku 上面你不会看到你电脑上的 sqlite3 资料库里面的资料。\r\n\r\n\r\n\r\n##### 步骤4 ：上网看你的程式\r\n\r\n***\r\n\r\n在终端机输入这些字：\r\n\r\n`heroku open`\r\n\r\n会在浏览器打开你上传到 Heroku 的程式。\r\n\r\n\r\n\r\n#### 解说\r\n\r\n***\r\n\r\n首先，我们要让 Heroku 跟我们的程式可以整合。这需要修改 Gemfile 和重跑 bundler。\r\n\r\n* `Gemfile` 这个档案列出了所有你的 Rails 程式所需要的 Ruby 程式库（Library），称为「gem」。我们这里谈的是说，要在自己电脑的开发环境使用 `sqlite3` gem（写在 development group 里面）， 但是在上传到 Heroku（production group）的時候要使用 `pg` gem，这是专门设计给 Heroku 使用的资料库。\r\n* `Bundler`是 Ruby 专案用来追踪有使用哪些 gem 的工具。我们透过 `Gemfile` 跟 Bundler 说我们要什么 gem，然后我们要确定这些 gem 都有安装。因为我们目前电脑里面没有 Heroku 用的资料库系统， 所以我们跳过不安装 production 用的 gem。别担心，Bundler 还是会帮我们记得，让 Heroku 帮你安装。\r\n\r\n你可以在任何你的程式没问题、会动的时候 deploy。标准流程长得像这样：\r\n\r\n![](http://imageshack.com/a/img924/7731/cKphSq.png)\r\n\r\n1. 改程式\r\n\r\n2. 把异动 commit 进 git （`git commit`）\r\n\r\n3. （重复）\r\n\r\n   ​\r\n\r\n每当你把异动 commit 进 git 之后，你都可以执行 git push heroku master，然后新版本就上线了！", is_hidden: false])
puts "生成第六章第 2 节"

Task.create([course_id: 1, post_id: 23, due_time: Time.zone.now + 1.month, description: "请将你的 Heroku 作品网址贴在这里"])
puts "生成作业 - 第六章第 2 节"

# Create Chapter

Chapter.create([chapter: "第七章 将「开发环境」变得顺手", course_id: "1"])
puts "生成第七章"

Post.create([course_id: "1", chapter_id: "7", title: "iTerm", article: "## iTerm\r\n\r\n很多朋友问，这个 Terminal 蛮好看的，请问要怎么调配出来。\r\n\r\n![](http://imageshack.com/a/img922/3027/vQzPvb.png)\r\n\r\n这套组合其实是一连串的配置：iTerm 与 zsh。\r\n\r\n\r\n\r\n####  iTerm2\r\n\r\n***\r\n\r\n![](http://imageshack.com/a/img922/1566/QZu9Eg.png)\r\n\r\n\r\n\r\n一般来说，程式设计师是很少用 Mac 官方所配的 Terminal App 做开发。都是使用 iTerm2 做高度客制的设定。\r\n\r\n请至官方网址：[http://www.iterm2.com/](http://www.iterm2.com/) 下载 iTerm，下载后拖来到 ”应用程式“，并打开。", is_hidden: false])
puts "生成第七章第 1 节"

Post.create([course_id: "1", chapter_id: "7", title: "zsh 与 ohmyzsh", article: "## zsh 与 ohmyzsh\r\n\r\n#### zsh\r\n\r\n***\r\n\r\nMac 系统预设的 shell 叫做 bash。而 zsh 多了一些比 bash 人性化的功能，能客制化的选项也比较多。\r\n\r\n\r\n\r\n#### 改变 shell 成为 zsh\r\n\r\n***\r\n\r\n- `chsh -s /bin/zsh` 即能改变成 zsh\r\n\r\n  ​\r\n\r\n#### 安装 oh-my-zsh\r\n\r\n***\r\n\r\n`cd ~/`\r\n`git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`\r\n`cp ~/.zshrc ~/.zshrc.orig`\r\n`cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc`\r\n`atom .zshrc` （修改 .zshrc 档案）\r\n\r\n\r\n\r\n#### 修改 theme\r\n\r\n***\r\n\r\n```\r\n#ZSH_THEME=\"robbyrussell\"\r\nZSH_THEME=\"agnoster\"\r\n```\r\n\r\n\r\n\r\n#### 替换掉 agnoster 的 theme source code\r\n\r\n***\r\n\r\n修改 `~/.oh-my-zsh/themes/agnoster.zsh-theme` 换成以下內容\r\n\r\n[https://gist.github.com/agnoster/3712874/raw/c3107c06c04fb42b0ca27b0a81b15854819969c6/agnoster.zsh-theme](https://gist.github.com/agnoster/3712874/raw/c3107c06c04fb42b0ca27b0a81b15854819969c6/agnoster.zsh-theme)\r\n\r\n\r\n\r\n#### 安装字型\r\n\r\n***\r\n\r\n由于 agnoster 需要特殊字型。\r\n\r\n所以必须安装 patched 的三个字体：[https://gist.github.com/1595572](https://gist.github.com/1595572)。(下载后双击安装这三个字体。)", is_hidden: false])
puts "生成第七章第 2 节"

Post.create([course_id: "1", chapter_id: "7", title: "替换掉 iTerm 布景", article: "## 替换掉 iTerm 布景\r\n\r\n#### 安装 SOLARIZED 布景\r\n\r\n***\r\n\r\n[SOLARIZED](http://ethanschoonover.com/solarized) 布景是特殊调制的一个背景。按此 [下载](http://ethanschoonover.com/solarized/files/solarized.zip) 最新版本。\r\n\r\n解压后里面有很多布景。\r\n\r\n\r\n\r\n#### 替换掉 iTerm 布景\r\n\r\n***\r\n\r\n- `Preference` -> `Profiles` -> `Colors` -> `Load Presets` -> `Import`，载入 `iterm2-colors-solarized` 目录下的两个 itermcolors\r\n- `Preference` -> `Profiles` -> `Colors` -> `Load Presets`，载入 `Solarized Dark`\r\n\r\n\r\n\r\n#### 替换掉 iTerm 字型\r\n\r\n***\r\n\r\n- `Preference` -> `Profiles` -> `Text` 换成 Menlo 14 字体", is_hidden: false])
puts "生成第七章第 3 节"

Chapter.update_all(is_hidden: false)
Post.update_all(is_hidden: false)

# Create Questions

for i in 1..10 do
  Question.create!([course_id: 1, title: "Admin Question no.#{i}", description: "这是用seed建立的第 #{i} 个问题", user_id: 1])
end
puts "10 Questions created by admin."
