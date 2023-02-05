# 2
# Принять имя пользователя как аргумент программы.
# Поздороваться с пользователем с использованием форматирования
# строки. Спросить какой язык у пользователя любимый, в случае, если это
# ruby, ответить что пользователь подлиза, иначе обязательно ответить, что
# скоро будет ruby и поставить различные комментарии для нескольких
# языков.

if ARGV.count < 1
    puts "Введите имя пользователя"
end

name = ARGV[0]
puts "Hello #{name}!"

puts "Какой твой любимый язык программирования?"
language = STDIN.gets.chomp

case language
    when 'ruby'
    puts 'Ты подлиза!'
    when 'python'
    puts 'Ты не подлиза!'
    when 'linux'
    puts 'not nature!'
    else
    puts 'Скоро будет ruby!'
end