require 'spec_helper'

describe User do
  
  let(:user) { FactoryGirl.build(:user)  }
  
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  
  describe "#admin?" do
    context "when role is admin" do
      it "should return true" do
        user.role = 'admin'
        user.admin?.should be_true
      end
    end
    context "when role is student" do
      it "should return false" do
        user.role = 'student'
        user.admin?.should be_false
      end
    end
    
    context "when role is teacher" do
      it "should return false" do
        user.role = 'teacher'
        user.admin?.should be_false
      end
    end
    
  end
  
  describe "#teacher?" do
    context "when role is teacher" do
      it "should return true" do
        user.role = 'teacher'
        user.teacher?.should be_true
      end
    end
    context "when role is student" do
      it "should return false" do
        user.role = 'student'
        user.teacher?.should be_false
      end
    end
  end
  
  
  describe "#student?" do
    context "when role is student" do
      it "should return true" do
        user.role = 'student'
        user.student?.should be_true
      end
    end
    context "when role is teacher" do
      it "should return false" do
        user.role = 'teacher'
        user.student?.should be_false
      end
    end
  end
  
end
