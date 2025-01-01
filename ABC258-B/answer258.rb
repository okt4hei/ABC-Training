$n = gets.chomp.to_i
$max = ""
$map = []

$n.times do
    $max += "0"  # 最大値の初期値を00...0に設定
    $map.push gets.chomp
end

## 次の座標を求める関数
## (current_x, current_y)から(direction_x, direction_y)の方向にstepだけ進んだ座標を求める
def next_position(current_x, current_y, direction_x, direction_y, step)
    x = (current_x + direction_x * step) % $n
    y = (current_y + direction_y * step) % $n
    return x, y
end

## 指定した方向に進み、その値を取得する関数
def search(position_x, position_y, direction_x, direction_y)
    value = ""
    $n.times do |i|
        current_x, current_y = next_position(position_x, position_y, direction_x, direction_y, i)
        target_value = $map[current_x][current_y]
        if i > 0 && value[0] < target_value
            return  # 途中の数字が1文字目より大きい場合は、打ち切る（その数字をスタートとすれば、より大きくなるため）
        end
        value += target_value
        if value < $max[0..i]
            return  # 現状の最大値を超えられないことが確定した場合は、打ち切る
        end
    end
    $max = value  # 最大値を更新
end

directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]

$n.times do |i|
    $n.times do |j|
        directions.each do |direction|
            search(i, j, direction[0], direction[1])
        end
    end
end

puts $max
