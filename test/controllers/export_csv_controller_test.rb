require 'test_helper'

class ExportCsvControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get export_csv_index,_url
    assert_response :success
  end

  test "should get export" do
    get export_csv_export_url
    assert_response :success
  end

end
