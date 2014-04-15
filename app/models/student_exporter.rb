class StudentExporter
  
  COLUMNS = {
    :username => :用户名, 
    :cipher => :密码提示问题,
    :cipher_answer => :密码提示答案,
    :name => :真实姓名,
    :telephone => :固定电话,
    :mobile => :手机号码,
    :email => :电子邮箱,
    :qq => :QQ,
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
  }.freeze

  def initialize(students, columns=nil)
    @students = students
    @columns = columns || COLUMNS.keys
  end

  def export
    CSV.generate do |csv|
      csv << @columns.map{|column| COLUMNS[column]}
      @students.each do |student|
        csv << @columns.map{|column| student.__send__ column }
      end
    end
  end
end
