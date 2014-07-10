module Learning
  class NotesController < LearningController
    belongs_to_module :learning

    before_action :find_video_watching, :except => :destroy

    def index
      @notes = @video_watching.notes.page(params[:page]).per(5)
      render :partial => 'learning/notes/notes', :object => @notes, :locals => {:video_watching => @video_watching}
    end

    def create
      @note = @video_watching.notes.build note_params
      if @note.save
        render :partial => 'learning/notes/note', :object => @note
      else
        render :text => '笔记创建失败', :status => 400
      end
    end

    def destroy
      @note = Note.find params[:id]
      @note.destroy
      render :plain => '删除成功'
    end

    private

    def note_params
      params.require(:note).permit(:content, :play_time_point)
    end

    def find_video_watching
      @video_watching = VideoWatching.find params[:video_watching_id]
    end
  end
end
