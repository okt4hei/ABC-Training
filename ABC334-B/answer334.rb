a, m, l, r = gets.chomp.split(' ').map(&:to_i)
first = l + (m - (l-a) % m) % m  # lより右で最初にツリーが立っている座標
puts (r - first) / m + 1
