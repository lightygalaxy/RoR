class Api::V1::QuizController < ApplicationController
  before_filter :student? , :except => :create
  before_filter :teacher? , :only => [:create]
  include Devise::Controllers::Helpers
  include ApiHelper
  respond_to :json
  def create
    # — Create record in Quiz
    # — Add Questions to Quiz -> Create Record in Quiz_Questions
    # — Assign Quiz to Students -> Create Records in Quiz_Users 
    
    @quiz = Quiz.create(created_by: current_user.id)
    @quiz.save!

    questions = Question.order("RAND()").limit(1)
    questions.each do |question|
      QuizQuestion.create(question_id: question.id, quiz_id: @quiz.id).save!
    end

    students = User.where(:role => 'student')

    students.each do |student|
      QuizUser.create(assigned_to: student.id, quiz_id: @quiz.id, assigned_by: current_user.id).save!
    end

    render :status=>200, :json=>{:status => "Success"}

  end

  def index
    quizes = Quiz.joins(:quiz_users).where("quiz_users.assigned_to"=> current_user.id)
    render :json=>quizes, root: false, :status=>200
  end

  def submit
  require 'date'
    # {
    # "quiz_id": 1,
    # "timestart": 1406716735,
    # "timefinish": 1406716735,
    # "answers": [
        # {
            # "question_id": 3,
            # "answer": "Test"
        # }
      # ]
    # }
          
    quiz_id = params[:quiz_id]
    timestart_epoch = params[:timestart]
    timefinish_epoch = params[:timefinish]
    answers = params[:answers]

    if request.format != :json
      render :status=>406, :json=>{:message=>"The request must be json"}
    return
    end

    if quiz_id.nil? or timestart_epoch.nil? or timefinish_epoch.nil? or answers.nil?
      render :status=>400, :json=>{:message=>"The request must contain required parameters"}
    return
    end

    # — Create record in Quiz_Response
    # — IS_CORRCET = Check whether ANSWER = Question_Answer.answer
    # Where QUIESTION_ID = Question_Answer.question_id
    # — MARKS =
    # IS_CORRCET is TRUE then get Quiz_Questions.marks
    # Where Quiz_Questions.quiz_id = QUIZ_ID
    # AND Quiz_Questions.question_id = QUIESTION_ID
    # — Create records in Quiz_Response_Answer for each response with     IS_CORRCET AND MARKS

    #Check Quiz Exits and Assigned to User or not –TODO

    timestart = Time.at(timestart_epoch).to_datetime
    timefinish = Time.at(timefinish_epoch).to_datetime

    total_correct = 0
    quiz_response = QuizResponse.create(quiz_id: quiz_id, timestart: timestart, timefinish: timefinish, submitted_by: current_user.id)
    answers.each do |answer|
      ques_id = answer[:question_id]
      answer = answer[:answer]
      is_correct = QuestionAnswer.where("question_id"=> ques_id, "answer" => answer).count(:id) > 0
      marks += QuizQuestion.where("question_id"=>ques_id, "quiz_id"=> quiz_id).pluck(:marks) if is_correct
      total_correct += 1 if is_correct
      QuizResponseAnswer.create(quiz_response_id: quiz_response.id, question_id: ques_id, is_correct: is_correct, answer: answer).save!
    end
    quiz_response.save!
   
   render :status=>200, :json=>{:number_of_correct_answers=> total_correct} 
     
  end
   
  def current_user
    return User.find_by_authentication_token(params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"])
  end
  
end