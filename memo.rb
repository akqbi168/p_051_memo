require "csv"

puts "1: 新規でメモを作成  2: 既存のメモ編集する"
memo_type = gets.chomp

if memo_type == "1"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp

  while File.exist?("#{file_name}.csv")
    puts "ファイルが存在します"
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
  end

  puts "メモしたい内容を入力してください"
  puts "完了したら Ctrl + D をおします"
  body = STDIN.read

  CSV.open("#{file_name}.csv", "w") do |test|
    test << [body]
  end

  puts "新規メモが保存されました"
  puts "ファイル：#{file_name}.csv"
  puts "保存内容：" + body[0, 50]

elsif memo_type == "2"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp

  until File.exist?("#{file_name}.csv")
    puts "ファイルが見つかりません"
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
  end

  puts "追記したい内容を入力してください"
  puts "完了したら Ctrl + D をおします"
  body = STDIN.read

  CSV.open("#{file_name}.csv", "a") do |test|
    test << [body]
  end
  
  puts "メモに内容が追記されました"
  puts "ファイル：#{file_name}.csv"
  puts "追記内容：" + body[0, 50]

else
  puts "アプリを再起動してください"

end