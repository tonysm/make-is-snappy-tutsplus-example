class QuestionsController < ApplicationController
  before_filter :auth, only: [:create]

  def index
      @question = Question.new
  end

  def create
      @question = current_user.questions.build(question_params)

      if @question.save
          flash[:success] = "Your queston has been posted!"
          redirect_to root_url
      else
          render 'index'
      end
  end

  private
    def question_params
        params.require(:question).permit(:body)
    end
end
