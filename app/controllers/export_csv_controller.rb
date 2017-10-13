class ExportCsvController < ApplicationController
  def index
    @users = User.all.order(:name)
    @users = @users.select { |u| u.canrole == 'premiere'}
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def export
  end
end
