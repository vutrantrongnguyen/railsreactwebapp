# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Hướng dẫn cài đặt trên macOS
🧱 1️⃣ Cài PostgreSQL qua Homebrew

Chạy lệnh:
`brew install postgresql`

Hoặc nếu bạn muốn bản mới nhất:
`brew install postgresql@15`

(Rails 7 tương thích tốt với PostgreSQL 13–16)

⚙️ 2️⃣ Khởi động dịch vụ PostgreSQL
Sau khi cài xong, khởi động:
`brew services start postgresql`


Kiểm tra lại:
`brew services list`

Bạn sẽ thấy dòng như:


```
Name          Status  User      File
postgresql@15 started <tên_user> ...
```

🧩 3️⃣ Tạo user và database mặc định (nếu cần)
Khi cài xong, PostgreSQL thường tạo user trùng tên với user macOS của bạn.
Bạn có thể kiểm tra bằng:
`psql postgres`

Nếu thấy vào được prompt kiểu:
`postgres=#`

thì OK ✅ (gõ \q để thoát).
Nếu không vào được, hãy tạo user mới:
createuser -s <tên_user_mac>

🧾 4️⃣ Kiểm tra file cấu hình Rails

Mở config/database.yml và đảm bảo phần development: như sau:
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: <tên_user_mac>   # Thường là tên máy bạn
  password:
  host: localhost

development:
  <<: *default
  database: myapp_development


⚠️ Lưu ý: username: phải đúng với user PostgreSQL hiện có.
Nếu bạn dùng Apple Silicon (M1/M2), đôi khi host là 127.0.0.1 sẽ ổn định hơn localhost.

🚀 5️⃣ Tạo database & migrate lại

Bây giờ chạy:

rails db:create
rails db:migrate


Nếu thấy:

Created database 'myapp_development'


thì bạn đã cài thành công 🎉