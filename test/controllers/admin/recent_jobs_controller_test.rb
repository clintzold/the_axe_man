require "test_helper"

class Admin::RecentJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_recent_job = admin_recent_jobs(:one)
  end

  test "should get index" do
    get admin_recent_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_recent_job_url
    assert_response :success
  end

  test "should create admin_recent_job" do
    assert_difference("Admin::RecentJob.count") do
      post admin_recent_jobs_url, params: { admin_recent_job: { description: @admin_recent_job.description, location: @admin_recent_job.location } }
    end

    assert_redirected_to admin_recent_job_url(Admin::RecentJob.last)
  end

  test "should show admin_recent_job" do
    get admin_recent_job_url(@admin_recent_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_recent_job_url(@admin_recent_job)
    assert_response :success
  end

  test "should update admin_recent_job" do
    patch admin_recent_job_url(@admin_recent_job), params: { admin_recent_job: { description: @admin_recent_job.description, location: @admin_recent_job.location } }
    assert_redirected_to admin_recent_job_url(@admin_recent_job)
  end

  test "should destroy admin_recent_job" do
    assert_difference("Admin::RecentJob.count", -1) do
      delete admin_recent_job_url(@admin_recent_job)
    end

    assert_redirected_to admin_recent_jobs_url
  end
end
