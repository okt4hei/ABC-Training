s = gets.chomp.split('').sort.join('')  # 辞書順で最も早い順番に並び替える
t = gets.chomp.split('').sort.reverse.join('')  # 辞書順で最も遅い順番に並び替える
puts s < t ? "Yes" : "No"
