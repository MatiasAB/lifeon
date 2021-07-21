require 'spec_helper'
require 'support/database_cleaner'
require 'devise'

RSpec.describe Task, type: :model do
  before :each do 
	@user = FactoryBot.create(:user)
	@task = FactoryBot.create(:task, user: @user)
  end
  
  subject { @task }
  
  it { should respond_to{:title} }
  it { should respond_to{:status} }
  it { should respond_to(:description) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:parent) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @task.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when title is not present" do
	before { @task.title = "" }
	it { should_not be_valid }
  end
	
  describe "when status is not present" do
	before { @task.status = nil }
    it { should_not be_valid }
  end
  
  
  
end
