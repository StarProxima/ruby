class Student
    attr_accessor :id, :surname, :first_name, :patronymic, :phone, :telegram, :email, :git
  
    def initialize(options = { surname: '', first_name: '', patronymic: '' })
      @id = options[:id]
      @surname = options[:surname]
      @first_name = options[:first_name]
      @patronymic = options[:patronymic]
      @phone = options[:phone]
      @telegram = options[:telegram]
      @email = options[:email]
      @git = options[:git]
    end

end

