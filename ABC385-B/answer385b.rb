$nums = gets.chomp.split(' ').map(&:to_i)
$position = [$nums[2] - 1, $nums[3] - 1]
$map = []
$nums[0].times do
    $map.push gets.chomp
end
command = gets.chomp

$house = 0  # 通過した家の数

## 座標(x, y)に移動を試みる関数
def try_move(x, y)
    if x < 0 || x >= $nums[0] || y < 0 || y >= $nums[1]
        return  # 移動先がマップ外なら何もしない
    end
    case $map[x][y]
    when "." # 移動先が通路なら移動
        $position = [x, y]
    when "@" # 移動先が家なら移動してカウントし、家を通路に変える
        $position = [x, y]
        $map[x][y] = "."
        $house += 1
    end
end

## コマンドに従って移動
command.size.times do |i|
    case command[i]
    when "U"
        try_move($position[0] - 1, $position[1])
    when "D"
        try_move($position[0] + 1, $position[1])
    when "L"
        try_move($position[0], $position[1] - 1)
    when "R"
        try_move($position[0], $position[1] + 1)
    end
end

puts "#{$position[0] + 1} #{$position[1] + 1} #{$house}"
