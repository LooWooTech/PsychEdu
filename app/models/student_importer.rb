class StudentImporter

  COLUMNS = {
    :username => :用户名, 
    :password => :密码, 
    :password_confirmation => :密码确认, 
    :cipher => :密码提示问题,
    :cipher_answer => :密码提示答案,
    :name => :真实姓名,
    :telephone => :固定电话,
    :mobile => :手机号码,
    :email => :电子邮箱,
    :qq => :qq,
    :identification => :证件号码,
    :birthday => :出生日期,
    :province => :所在省,
    :unit_code => :单位编码,
    :unit_name => :所在单位,
    :address => :邮寄地址,
    :zip_code => :邮编,
    :education => :学历,
    :special_field => :所学专业,
    :level => :已获心理咨询师级别,
    :certificate_number => :证书编号,
    :certify_date => :获得日期,
    :training_experience => :心理咨询师培训经历,
    :psychology_job => :现从事哪些心理服务工作,
    :note => :备注信息,
    :created_at => :添加时间
  }

  def initialize(file, topic_id_list, admin)
    @file = file
    @errors = []
    @topic_id_list = topic_id_list || []
    @admin = admin
    begin
      parse_file
      import if !failed?
    rescue ArgumentError
      @errors << '文件编码无法识别。'
    end
  end

  def failed?
    @errors.any?
  end

  def errors
    @errors.clone
  end

  private

  def import
    @data.each_with_index do |row_data, index|
      row = Row.new(row_data, @topic_id_list, @admin)
      @errors << "第#{index + 1}行：#{row.error_message}" if row.failed?
    end
  end

  def parse_file
    begin
      @data = SmarterCSV.process @file
    rescue ArgumentError
      @data = SmarterCSV.process @file, :file_encoding => 'GBK'
    end
    validate_columns
  end

  def validate_columns
    COLUMNS.each{|key, value| @errors << "“#{value}”列缺失" if @data[0].keys.exclude? value }
  end

  class Row

    attr_reader :error_message

    def initialize(row, topic_id_list, admin)
      @row = row
      @error_message = ''
      @topic_id_list = topic_id_list
      @admin = admin
      import
    end

    def failed?
      @error_message.present?
    end

    private

    def import
      if username.present?
        student.update_attributes COLUMNS.keys.inject({}){|result, key| result.merge key => __send__(key) }
        if student.valid?
          @topic_id_list.each do |topic_id|
            unless student.topic_learnings.where(:topic_id => topic_id).first
              topic_learning = student.topic_learnings.create :topic_id => topic_id
              topic_learning.learning_periods.create :start_on => Date.today, :end_on => (Date.today + 365.days)
            end
          end
        else
          @error_message = student.errors.full_messages.join('、') if student.invalid?
        end
      else
        @error_message = "用户名为空，无法导入。"
      end
    end

    def student
      return @student if @student
      account = Account.where(:username => username, :owner_type => 'Student').first
      @student = account.nil? ? Student.new(:added_by => @admin) : account.owner
      @student.account ||= Account.new
      @student
    end

    _columns_without_province = COLUMNS.clone
    _columns_without_province.delete(:province)
    _columns_without_province.each do |key, value|
      define_method key do
        @row[value]
      end
    end

    def province
      Student::PROVINCES.find{|name| @row[:所在省].include? name }
    end

  end
end
