require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get top_movies" do
    get movie_top_movies_url
    assert_response :success
  end

end
