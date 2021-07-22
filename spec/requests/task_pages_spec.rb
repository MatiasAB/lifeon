require 'rails_helper'
require 'spec_helper'
require 'support/database_cleaner'
require 'devise'

RSpec.describe "TaskPages", type: :feature do
  subject { page }

  let(:user) { FactoryBot.create(:user) }
  before { login_as user }

  describe "task creation" do
    before { visit user_path(user) }
	
    describe "with invalid information" do

      it "should not create a task" do
        expect { click_button "New Task" }.not_to change(Task, :count)
      end

      describe "error messages" do
        before { click_button "New Task" }
        it { should have_content('error') }
      end
    end
	
    describe "with valid information" do
      before { fill_in 'task_title', with: "Lorem ipsum" }
      it "should create a task" do
        expect { click_button "New Task" }.to change(Task, :count).by(1)
      end
    end
  end
  
  describe "task destruction" do
	before { @task = FactoryBot.create(:task, user: user) }

    describe "as user" do
      before { visit user_path(user) }

      it "should delete a task" do
        expect { click_link @task.title }.to change(Task, :count).by(-1)
      end
    end
  end
end
