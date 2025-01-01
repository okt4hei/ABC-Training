$h, $w, $d = gets.chomp.split(' ').map(&:to_i)
map = []
floors = []  # 床の座標を格納する配列
$h.times do |i|
    row = gets.chomp
    $w.times do |j|
        if row[j] == "."
            floors.push [i, j]
        end
    end
    map.push row
end

ans = 0  # 加湿されるマスの最大値

## 指定された座標の周囲$dマスを加湿する
## count_only: falseの場合、mapを破壊的に変更する（加湿したマスを#に変える）
def humidification(map, (x, y), count_only)
    res = 0
    for i in -$d..$d do
        for j in -($d-i.abs)..$d-i.abs do
            tx = x + i
            ty = y + j
            if tx < 0 || tx >= $h || ty < 0 || ty >= $w
                next
            end
            if map[tx][ty] == "."
                res += 1
                if !count_only
                    map[tx][ty] = "#"
                end
            end
        end
    end
    return res
end

def max(a, b)
    return (a > b) ? a : b
end

def deepcopy(map)
    res = []
    map.size.times do |i|
        res.push map[i].dup
    end
    return res
end


floors.size.times do |i|
    map_dup = deepcopy(map)
    ans_tmp = humidification(map_dup, floors[i], false)  # 1つ目の加湿器を置く
    for j in i+1...floors.size do
        ans = max(ans, ans_tmp + humidification(map_dup, floors[j], true))  # 2つ目の加湿器を置く
    end
end

puts ans