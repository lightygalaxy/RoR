require 'spec_helper'

describe Api::V1::QuizController do

  before do 
      @student = FactoryGirl.create(:user, authentication_token: "studentToken", role: 'student')
      @teacher = FactoryGirl.create(:teacher)
  end

  describe "with vaid token of user role student", validTokenStudent: true do
    before(:each) { authWithUser(@student) }

    describe "POST #create" do
      before(:each) { post :create, {}, { "HTTP_X-AUTH-TOKEN"=>@student.authentication_token}}
      
      it "returns error" do
        expect(json['errors']).to eq("Access Denied – Required Teacher Access")
      end

      it { should respond_with 403 }
    end
   
    describe "GET #index" do
      
      before do
        @questions = FactoryGirl.create_list(:question, 3)
        FactoryGirl.create(:question_answer, question: @questions.first, answer: "right")
        FactoryGirl.create(:question_answer, question: @questions.second, answer: "right")
        FactoryGirl.create(:question_answer, question: @questions.third, answer: "right")
        
        @quizzes =  FactoryGirl.create_list(:quiz, 3)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.first, question: @questions.first)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.first, question: @questions.second)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.first, question: @questions.third)
        FactoryGirl.create(:quiz_user, quiz: @quizzes.first, assigned_to: @student.id)
        
        FactoryGirl.create(:quiz_question, quiz: @quizzes.second, question: @questions.first)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.second, question: @questions.second)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.second, question: @questions.third)
        FactoryGirl.create(:quiz_user, quiz: @quizzes.second, assigned_to: @student.id)
        
        FactoryGirl.create(:quiz_question, quiz: @quizzes.third, question: @questions.first)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.third, question: @questions.second)
        FactoryGirl.create(:quiz_question, quiz: @quizzes.third, question: @questions.third)
        FactoryGirl.create(:quiz_user, quiz: @quizzes.third, assigned_to: @student.id)
        
      end  
      before(:each) { get :index, {},  { "HTTP_X-AUTH-TOKEN"=>@student.authentication_token}}
      
      it "returns a subset of quizzes" do
        expect(json.count).to eq(3)
      end
    
      it { should respond_with 200 }
    end
    
    describe "POST #submit" do
      before do
        @questions = FactoryGirl.create_list(:question, 3)
        FactoryGirl.create(:question_answer, question: @questions.first, answer: "right")
        FactoryGirl.create(:question_answer, question: @questions.second, answer: "right")
        FactoryGirl.create(:question_answer, question: @questions.third, answer: "right")
        
        @quiz =  FactoryGirl.create(:quiz)
        FactoryGirl.create(:quiz_question, quiz: @quiz, question: @questions.first)
        FactoryGirl.create(:quiz_question, quiz: @quiz, question: @questions.second)
        FactoryGirl.create(:quiz_question, quiz: @quiz, question: @questions.third)
        FactoryGirl.create(:quiz_user, quiz: @quiz, assigned_to: @student.id)
        
        
        @params = { :format => 'json', :quiz_id => @quiz.id, :timestart => 1406716735, :timefinish => 1406716735, :answers => [ {:question_id => @questions.first.id, :answer => "wrong"}, { :question_id => @questions.second.id, :answer => "wrong" } ]}
      end
      
      before(:each) { post :submit, @params, { "HTTP_X-AUTH-TOKEN"=>@student.authentication_token}}

      it "returns number of correct answers count" do
        expect(json).to have_key('number_of_correct_answers')
      end
      
      it { should respond_with 200 }
    end
  end
  
  describe "with vaid token of user role teacher", validTokenTeacher: true do
    before(:each) { authWithUser(@teacher) }

    describe "POST #create" do
      before(:each) { post :create, {}, { "HTTP_X-AUTH-TOKEN"=>@teacher.authentication_token}}
      
      it "returns status success" do
        expect(json['status']).to eq("Success")
      end

      it { should respond_with 200 }
    end
    
    describe "GET #index" do
     
      before(:each) { get :index, {}, { "HTTP_X-AUTH-TOKEN"=>@teacher.authentication_token}}
      
      it "returns errors" do
        expect(json['errors']).to eq("Access Denied – Required Student Access")
      end

      it { should respond_with 403 }
    end
    
    describe "POST #submit" do
      
      before(:each) { post :submit, {}, { "HTTP_X-AUTH-TOKEN"=>@teacher.authentication_token}}
      
      it "returns error" do
        expect(json['errors']).to eq("Access Denied – Required Student Access")
      end

      it { should respond_with 403 }
    end
  end
  
  
  describe "without a valid token", noToken: true do
    before(:each) { clearToken }
    
    describe "POST #create is unauthorized" do
    
      before(:each) { post :create }
        
        it "returns error" do
          expect(json['errors']).to eq("Invalid Token")
        end
  
        it { should respond_with 401 }   
      end
      
      describe "GET #index is unauthorized" do
        before(:each) { get :index }
        
        it "returns error" do
          expect(json['errors']).to eq("Invalid Token")
        end
  
        it { should respond_with 401 } 
      end
      
      describe "POST #submit is unauthorized" do
         before(:each) { post :submit }
        
        it "returns error" do
          expect(json['errors']).to eq("Invalid Token")
        end
  
        it { should respond_with 401 } 
      end
  end
  
end
