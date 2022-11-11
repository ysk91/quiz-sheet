module QuizzesHelper
  
  def convert_url_to_spreadsheet_id(url)
    spreadsheet_id = url[/(?<=https:\/\/docs.google.com\/spreadsheets\/d\/).+(?=\/edit)/]
  end
  
end
