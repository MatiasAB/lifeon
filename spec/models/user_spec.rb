require 'spec_helper'
require 'support/database_cleaner'
require 'devise'

describe User do
	# before { @user = User.new(email: "user@example.com", password: 'password123', password_confirmation: 'password123', username: "ExampleUser") }
	before { @user = FactoryBot.create(:user) }

    subject { @user }

    it { should respond_to(:username) }
    it { should respond_to(:email) }
	it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
	it { should respond_to(:tasks) }

    it { should be_valid }
	
	describe "when username is not present" do
      before { @user.username = "" }
      it { should_not be_valid }
    end
	
	describe "when email is not present" do
      before { @user.email = "" }
      it { should_not be_valid }
    end
	
	describe "when name is too long" do
      before { @user.username = "a" * 51 }
      it { should_not be_valid }
    end
	
	describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          @user.should_not be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          @user.should be_valid
        end
      end
    end
	
	describe "task associations" do

		before { @user.save }
		
		it "should destroy associated tasks" do
		  FactoryBot.create_list(:task, 2, user: @user)
		  tasks = @user.tasks.dup
		  @user.destroy
		  # tasks.should be_empty
		  tasks.each do |task|
			Task.find_by_id(task.id).should be_nil
		  end
		end
    end
end