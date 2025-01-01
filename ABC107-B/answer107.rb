h, w = gets.chomp.split(' ').map(&:to_i)

skip_rows = Array.new(h, true)  # スキップ対象の行
skip_columns = Array.new(w, true)  # スキップ対象の列

grid = []

h.times do |i|
    row = gets.chomp
    w.times do |j|
        ## この行、この列に#がある場合はスキップ対象から外す
        if row[j] == "#"
            skip_rows[i] = false
            skip_columns[j] = false
        end
    end
    grid.push row
end

h.times do |i|
    if skip_rows[i]
        next
    end
    row = ""
    w.times do |j|
        if skip_columns[j]
            next
        end
        row += grid[i][j]
    end
    puts row
end
