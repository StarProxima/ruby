# 3.Продолжение предыдущего задания. Попросить пользователя
# ввести команду языка ruby. И команду OC. Выполнить команду руби и
# команду операционной системы.


require 'open3'

puts "Команда OS:"
cmd = gets.chomp
Open3.pipeline(cmd)

puts "Код на Ruby:"
rubyCmd = gets.chomp
system "ruby -e \'#{rubyCmd}\'"


