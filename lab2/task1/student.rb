class Student
    attr_accessor :id, :surname, :first_name, :patronymic, :phone, :telegram, :email, :git
    attr_reader :initials
    def initialize(options = { surname: '', first_name: '', patronymic: '' })
      @id = options[:id]
      @surname = options[:surname]
      @first_name = options[:first_name]
      @patronymic = options[:patronymic]
      @phone = options[:phone]
      @telegram = options[:telegram]
      @email = options[:email]
      @git = options[:git]
      @initials = "#{first_name[0]}.#{patronymic[0]}."

      self.phone = options[:phone]
      
    end

    def get_info
        info = "#{surname} #{initials}."
        info += " Git: #{git}" if git
        if phone
          info += " Phone: #{phone}"
        elsif telegram
          info += " Telegram: #{telegram}"
        elsif email
          info += " Mail: #{email}"
        end
        info
      end

    def self.valid_phone?(phone)
        phone.nil? || phone.is_a?(String) && phone.match?(/\A(\+)?(\d|\s){10,}\z/)
    end

    def self.valid_telegram?(telegram)
        telegram.nil? || telegram.is_a?(String) && telegram.match?(/\A[a-zA-Z0-9]+\z/)
    end
    
    def self.valid_email?(email)
        email.nil? || email.is_a?(String) && email.match?(/\A[a-zA-Z0-9]+@[a-z]+.[a-z]+\z/)
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

    def validate
        validate_git
        validate_contact
    end

    def validate_git
        if git.nil? || git.empty?
        raise ArgumentError, "GitHub URL cannot be blank"
        end
    end

    def validate_contact
        if phone.nil? && telegram.nil? && mail.nil?
        raise ArgumentError, "At least one contact method must be provided"
        end
    end

    def set_contacts(contacts)
        contacts.each do |key, value|
            case key.to_sym
            when :phone
            self.phone = value
            when :telegram
            self.telegram = value
            when :mail
            self.mail = value
            else
            raise ArgumentError, "Invalid contact type: #{key}"
            end
        end
    end

    def self.read_from_txt(file_path)
        students = []
        begin
          File.open(file_path, 'r') do |file|
            file.each_line do |line|
              id, surname, first_name, patronymic, phone, telegram, email, git = line.split(',')
              params_to = { id: id, surname: surname, first_name: first_name, patronymic: patronymic, phone: phone, telegram: telegram, email: email, git: git }
              Student.new(params_to) << students
            end
          end
          students
        rescue => exception
          raise "File not found at the given address #{file_path}. Exception: #{exception.message}"
        end
      end

      def self.write_to_txt(file_path, students)
        begin
          File.open(file_path, 'w') do |file|
            students.each do |student|
              file.puts "#{student.id},#{student.surname},#{student.first_name},#{student.patronymic},#{student.phone},#{student.telegram},#{student.email},#{student.git}"
            end
          end
        rescue => exception
          raise "File could not be written at the given address #{file_path}. Exception: #{exception.message}"
        end
      end

    def to_s
        "ID: #{id}, Surname: #{surname}, First name: #{first_name}, Patronymic: #{patronymic}, Phone: #{phone}, Telegram: #{telegram}, Mail: #{email}, Git: #{git}"
    end
end

