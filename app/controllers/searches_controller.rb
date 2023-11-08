class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search 
    @model = params[:model] #ユーザーが選択した検索対象のモデル（"user" または "book"）を@model変数に代入
    @content = params[:content] #ユーザーが入力した検索キーワードを@content変数に代入
    @method = params[:method] #ユーザーが選択した検索方法（"perfect"、"forward"、"backward"、"partial"）を@method変数に代入
    
    # 選択したモデルに応じて検索を実行
    if @model  == "user" #選択されたモデルが"user"の場合ユーザーの検索を行う
      @records = User.search_for(@content, @method) #選択された検索対象（ユーザー）に対して、search_forメソッドを呼び出して検索を実行、結果を@records変数に代入
    else #"book"の検索を行う
      @records = Books.search_for(@content, @method) #選択された検索対象（書籍）に対して、search_forメソッドを呼び出して検索を実行、結果を@records変数に代入
    end
  end
end
