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

      self.phone = options[:phone]
    end

    def self.valid_phone?(phone)
        phone == nil || phone.is_a?(String) && phone.match?(/\A(\+)?(\d|\s){10,}\z/)
    end

    def self.valid_telegram?(telegram)
        telegram == nul || telegram.is_a?(String) && telegram.match?(/\A[a-zA-Z0-9]+\z/)
    end
    
    def self.valid_email?(email)
        email == nil || email.is_a?(String) && email.match?(/\A[a-zA-Z0-9]+@[a-z]+.[a-z]+\z/)
    end
    
    def self.valid_git?(git)
        git == nil || git.is_a?(String) && git.match?(/\Ahttps?:\/\/github\.com\/[a-zA-Z0-9]+\/[a-zA-Z0-9]+\z/)
    end

    def phone=(value)
        if self.class.valid_phone?(value)
          @phone = value
        else
          raise ArgumentError, "Invalid phone number format"
        end
    end

    def to_s
        "ID: #{id}, Surname: #{surname}, First name: #{first_name}, Patronymic: #{patronymic}, Phone: #{phone}, Telegram: #{telegram}, Mail: #{email}, Git: #{git}"
    end
end

