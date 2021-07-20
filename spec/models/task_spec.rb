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
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  
  it { should be_valid }
end
