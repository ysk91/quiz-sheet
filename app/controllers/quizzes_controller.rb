class QuizzesController < ApplicationController
  include QuizzesHelper

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = Question.where(quiz_id: @quiz.id)
  end

  def new
    @quiz = Quiz.new
    @questions = Question.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    # spreadsheet_idを作る
    @quiz[:spreadsheet_id] = @quiz.url[/(?<=https:\/\/docs.google.com\/spreadsheets\/d\/).+(?=\/edit)/]
    if @quiz.save
      # Active jobを実行してQuestionインスタンスを作成
      SpreadsheetsImportJob.perform_now(@quiz.spreadsheet_id, ["シート1!A:B"], @quiz.id)
      redirect_to quiz_path(@quiz)
    else
      render "new"
    end    
  end

  private

    def quiz_params
      params.require(:quiz).permit(:title, :url)
    end
end
