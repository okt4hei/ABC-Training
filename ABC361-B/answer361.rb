x11, y11, z11, x12, y12, z12 = gets.chomp.split(' ').map(&:to_i)
x21, y21, z21, x22, y22, z22 = gets.chomp.split(' ').map(&:to_i)

if x11 >= x22 || x21 >= x12 || y11 >= y22 || y21 >= y12 || z11 >= z22 || z21 >= z12
    puts "No"
else
    puts "Yes"
end
