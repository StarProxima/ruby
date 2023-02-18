require "./student.rb"

student1 = Student.new({ surname: '1', first_name: '2', patronymic: '3'})
student2 = Student.new({ surname: '3', first_name: '4', patronymic: '5', phine: '123'})

puts Student.valid_phone?('+7918673844488')
puts Student.valid_telegram?('mfewef')
puts Student.valid_email?('mfewef@yfa.ru')
puts Student.valid_git?('https://github.com/StarProxima')


student1.phone = '+79186733922'
student1.phone = '123'

puts(student1)
puts(student2)