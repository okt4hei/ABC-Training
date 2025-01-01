l = 1  # 左手の位置
r = 2  # 右手の位置
$n, q = gets.chomp.split(' ').map(&:to_i)
ans = 0  # 移動回数の合計

## edge1 と edge2 の間に value があるかどうか
def between(value, edge1, edge2)
    return (value > edge1 && value < edge2) || (value > edge2 && value < edge1)
end

## target から goal までの移動回数を返す
## target: 動かす手の位置
## other: 動かさない手の位置
def count_move(target, other, goal)
    if between(other, target, goal)  # まずはN↔1という移動をしないような方向を考える
        return $n - (target - goal).abs  # 間に動かさない手がある場合は、逆方向に動かす
    end
    return (target - goal).abs
end

q.times do
    h, t = gets.chomp.split(' ')
    t = t.to_i
    if h == "L"
        ans += count_move(l, r, t)
        l = t
    else
        ans += count_move(r, l, t)
        r = t
    end
end

puts ans
