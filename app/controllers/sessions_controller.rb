class SessionsController < ApplicationController
  def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    student = Student.from_omniauth(access_token)
    log_in(student)
    # Access_token is used to authenticate request made from the rails application to the google server
    student.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    student.google_refresh_token = refresh_token if refresh_token.present?
    student.save
    redirect_to root_path
  end
end
