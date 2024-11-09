require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
    #新規でメモを作成する処理
    puts "新しいメモを入力してください(完了するには Ctrl+d を押してください):"
    content = STDIN.read.chomp   #Ctrl+dで終了
    CSV.open("memo.csv", "w") do |csv|
        csv << ["メモ"]
        csv << [content]
    end
    
    puts "新しいファイルにメモが保存されました。"

elsif memo_type == 2
    #既存のメモを編集する処理
    puts "追記するメモを入力してください(完了するには Ctrl+d を押してください):"
    content = STDIN.read.chomp    #Ctrl+dで終了

    CSV.open("memo.csv", "a") do |csv|
        csv << [content]
    end

    puts "既存のファイルにメモが保存されました。"

else
    #不正な値が入力された場合の処理
    puts "不正な値です。１か２を入力してください。"
end