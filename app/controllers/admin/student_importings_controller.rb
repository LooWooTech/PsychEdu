module Admin
  class StudentImportingsController < AdminController
    def create
      @importer = StudentImporter.new(params[:file].path, params[:topic_ids])
      if @importer.failed?
        flash[:error] = raw @importer.errors.join('<br />')
      else
        flash[:notice] = '导入成功'
      end
      redirect_to student_importings_path
    end
  end
end
