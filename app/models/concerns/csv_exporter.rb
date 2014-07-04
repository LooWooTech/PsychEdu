module CSVExporter
  def export
    CSV.generate do |csv|
      csv << @columns.keys.map{|column| @columns[column]}
      @collection.each do |item|
        csv << @columns.keys.map{|column| item.__send__ column }
      end
    end
  end
end
