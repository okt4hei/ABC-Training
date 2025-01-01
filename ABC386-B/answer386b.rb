prev = "1"  # 直前の数字の初期値。0以外であれば何でも良い。
ans = 0  # 操作数の合計

gets.chomp.chars.each do |num|
    if prev == "0" && num == "0"  # 直前が0で、現在の数字も0ならカウントを増やさない
        prev = "1"  # 直前の数字を0以外にリセット
    else
        prev = num
        ans += 1
    end
end

puts ans
