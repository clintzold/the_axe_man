require "test_helper"

class Admin::JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_job = admin_jobs(:one)
  end

  test "should get index" do
    get admin_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_job_url
    assert_response :success
  end

  test "should create admin_job" do
    assert_difference("Admin::Job.count") do
      post admin_jobs_url, params: { admin_job: { description: @admin_job.description, location: @admin_job.location } }
    end

    assert_redirected_to admin_job_url(Admin::Job.last)
  end

  test "should show admin_job" do
    get admin_job_url(@admin_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_job_url(@admin_job)
    assert_response :success
  end

  test "should update admin_job" do
    patch admin_job_url(@admin_job), params: { admin_job: { description: @admin_job.description, location: @admin_job.location } }
    assert_redirected_to admin_job_url(@admin_job)
  end

  test "should destroy admin_job" do
    assert_difference("Admin::Job.count", -1) do
      delete admin_job_url(@admin_job)
    end

    assert_redirected_to admin_jobs_url
  end
end
