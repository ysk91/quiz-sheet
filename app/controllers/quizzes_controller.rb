class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = Question.where(quiz_id: @quiz.id)
  end

  def new
    @quiz = Quiz.new
    # @questions = Question.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save

      redirect_to quiz_path(@quiz)
    else
      render "new"
    end    
    # @questions = Question.new(questions_params)
  end

  private

    def quiz_params
      params.require(:quiz).permit(:title, :url, :spreadsheet_id)
    end

    def questions_params
      params.require(:question).merge(quiz_id: @quiz.id)
    end
end
