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

    def self.valid_phone?(phone)
        phone.is_a?(String) && phone.match(/\A[0-9]+\z/)
    end

    def to_s
        "ID: #{id}, Surname: #{surname}, First name: #{first_name}, Patronymic: #{patronymic}, Phone: #{phone}, Telegram: #{telegram}, Mail: #{email}, Git: #{git}"
    end
end

