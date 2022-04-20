class NotesController < ApplicationController
  before_action :set_game, only: [:create, :destroy]

  def create
    @note = @game.notes.new(note_params)
    if @note.save
      redirect_to @game, notice: 'Note successfully added!'
    else
      redirect_to @game, alert: 'Unable to add note!'
    end
  end

  def destroy
    @note = @game.notes.find(params[:id])
    @note.destroy
    redirect_to @game, notice:  'Note deleted'
  end

  private
  def set_game
    @game = Game.find(params[:game_id])
  end

  def note_params
    params.require(:note).permit(:title, :note, :score)
  end
end
