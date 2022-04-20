class Api::NotesController < ApiController
  def index
    render json: Note.all
  end

  def show
    note = Note.find_by(id: params[:id])
    if note
      render json: note
    else
      render json: {error: 'Note not found'}, status: 404
    end
  end

  def search
    render json: Note.where('title LIKE ?', "%#{params[:title]}%")
  end

  def create
    game = Game.find(params[:game_id])
    note = game.notes.new(title: params[:title], note: params[:note], score: params[:score], date: params[:date] )
    if note.save
      render json: note
    else
      render json: { error: 'Cannot create note'}, status: 404
    end
  end

  def destroy
    game = Game.find(params[:game_id])
    game.notes.find(params[:id]).destroy!
    render json: {notice: 'Successfully destroy the note'}
  end


end
