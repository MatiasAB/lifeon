require 'spec_helper'
require 'support/database_cleaner'
require 'devise'

RSpec.describe "Authentication", type: :request do
  describe "authorization" do

	describe "in the Tasks controller" do

        describe "submitting to the create action" do
          before { post tasks_path }
          specify { response.should redirect_to(user_session_path) }
        end

        describe "submitting to the destroy action" do
          before { delete task_path(FactoryBot.create(:task)) }
          specify { response.should redirect_to(user_session_path) }
        end
    end
  end
end