a, b, w = gets.chomp.split(' ').map(&:to_i)
w *= 1000

## まずは、Unsatisfiableとならないと仮定してminとmaxを求める
min = w / b + (w % b == 0 ? 0 : 1)
max = w / a

if w / min < a
    puts "UNSATISFIABLE"  # この条件が成り立つ場合、Unsatisfiableとなる
else
    puts "#{min} #{max}"
end
