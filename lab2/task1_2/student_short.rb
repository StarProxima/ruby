class StudentShort < StudentBase
    
    public_class_method :new
  
    private
  
    attr_writer :last_name_and_initials, :contact
  
    public
  
    attr_reader :last_name_and_initials, :contact
  
    def initialize(id, info_str)
      params = JSON.parse(info_str, { symbolize_names: true })
      raise ArgumentError, 'Fields required: last_name_and_initials' if !params.key?(:last_name_and_initials) || params[:last_name_and_initials].nil?
  
      self.id = id
      self.last_name_and_initials = params[:last_name_and_initials]
      self.contact = params[:contact]
      self.git = params[:git]
  
      options = {}
      options[:id] = id
      options[:git] = git
      options[contact[:type].to_sym] = contact[:value] if contact
      super(**options)
    end

    def self.from_student(student)
        raise ArgumentError, 'Student ID is required' if student.id.nil?
    
        StudentShort.new(student.id, student.short_info)
    end
  
    def to_s
      result = last_name_and_initials
      %i[id contact git].each do |attr|
        attr_val = send(attr)
        result += ", #{attr}=#{attr_val}" unless attr_val.nil?
      end
      result
    end
  end