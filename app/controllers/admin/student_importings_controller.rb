module Admin
  class StudentImportingsController < AdminController
    def create
      @importer = StudentImporter.new(params[:file].path, params[:topic_ids], current_user)
      if @importer.failed?
        flash[:error] = @importer.errors.join('<br />')
      else
        flash[:notice] = '导入成功'
      end
      redirect_to admin_student_importings_path
    end
  end
end
