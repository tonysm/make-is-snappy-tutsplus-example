class QuestionsController < ApplicationController
  before_filter :auth, only: [:create, :your_questions, :edit, :update]

  def index
      @question = Question.new
      @questions = Question.unsolved(params)
  end

  def create
      @question = current_user.questions.build(question_params)

      if @question.save
          flash[:success] = "Your queston has been posted!"
          redirect_to @question
      else
          @questions = Question.unsolved(params)
          render 'index'
      end
  end

  def show
      @question = Question.find(params[:id])
      @answer = Answer.new
  end

  def your_questions
      @questions = current_user.your_questions(params)
  end

  def edit
      @question = current_user.questions.find(params[:id])
  end

  def update
      @question = current_user.questions.find(params[:id])

      if @question.update_attributes(question_edit_params)
          flash[:success] = 'Your question has been updated'
          redirect_to @question
      else
          render 'edit'
      end
  end

  def search
      @questions = Question.search(params)
  end

  private
    def question_edit_params
        params.require(:question).permit(:body, :solved)
    end

    def question_params
        params.require(:question).permit(:body)
    end
end
