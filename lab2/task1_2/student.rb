require 'json'
require_relative 'student_base'

class Student < StudentBase
  public_class_method :new

  public :phone, :telegram, :email, 'id=', 'phone=', 'telegram=', 'email=', 'git='

  attr_reader :last_name, :first_name, :father_name

  def initialize(last_name, first_name, father_name, **options)
    self.last_name = last_name
    self.first_name = first_name
    self.father_name = father_name
    super(**options)
  end

  def self.from_hash(hash)
    raise ArgumentError, 'Fields required: fist_name, last_name, father_name' unless hash.key?(:first_name) && hash.key?(:last_name) && hash.key?(:father_name)

    first_name = hash.delete(:first_name)
    last_name = hash.delete(:last_name)
    father_name = hash.delete(:father_name)

    Student.new(first_name, last_name, father_name, **hash)
  end

  def self.from_json(json)
    params = JSON.parse(json, { symbolize_names: true })
    from_hash(params)
  end

  def last_name=(new_last_name)
    raise ArgumentError, "Invalid argument: last_name=#{new_last_name}" unless Student.valid_name?(new_last_name)

    @last_name = new_last_name
  end

  def first_name=(new_first_name)
    raise ArgumentError, "Invalid argument: first_name=#{new_first_name}" unless Student.valid_name?(new_first_name)

    @first_name = new_first_name
  end

  def father_name=(new_father_name)
    raise ArgumentError, "Invalid argument: father_name=#{new_father_name}" unless Student.valid_name?(new_father_name)

    @father_name = new_father_name
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
  end

  def last_name_and_initials
    "#{last_name} #{first_name[0]}. #{father_name[0]}."
  end

  def short_info
    info = {}
    info[:last_name_and_initials] = last_name_and_initials
    info[:contact] = short_contact
    info[:git] = git
    JSON.generate(info)
  end

  def to_s
    result = "#{last_name} #{first_name} #{father_name}"
    %i[id phone telegram email git].each do |attr|
      attr_val = send(attr)
      result += ", #{attr}=#{attr_val}" unless attr_val.nil?
    end
    result
  end

  def to_hash
    attrs = {}
    %i[last_name first_name father_name id phone telegram email git].each do |attr|
      attr_val = send(attr)
      attrs[attr] = attr_val unless attr_val.nil?
    end
    attrs
  end

  def to_json
    JSON.generate(to_hash)
  end
end