class MonthlyOnlineTrackingExporter

  def initialize(table, start_at, end_at)
    @table = table
    @months = (start_at..end_at).select{|d| d.day == 1 }.map(&:month)

    @header = ['登录名', '姓名', '单位编码', '所学专题']
    @header.concat @months.map{|month| "#{month}月" }
    @header << '合计'
  end

  def export
    CSV.generate do |csv|
      csv << @header
      @table.each do |topic_learning, trackings|
        row = []
        row << topic_learning.student_username
        row << topic_learning.student_name
        row << topic_learning.student_unit_code
        row << topic_learning.name
        @months.each do |month|
          row << ((trackings.find{|tracking| tracking.updated_at.month == month}.try(:seconds) || 0) / 60.0 / 60.0).round(2)
        end
        row << (trackings.sum(&:seconds) / 60.0 / 60.0).round(2)
        csv << row
      end
    end
  end
end
