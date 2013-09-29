class UserController < ApplicationController
  #user table imei, sn, androidid, location, pkgs,info
  def regist
    param= parseimeisnandroidid(params)
    exist = is_user_exist(param)
    result_code = 0
    result_msg = 'success'
    if exist
      result_code = 1
      result_msg = 'exist'
    else
      user = User.create(
          :imei=> param[:imei],
          :sn=>param[:sn],
          :androidid=>param[:androidid],
          :pkgs=>params[:pkgs],
          :info=>params[:info]
      )
      save_result=user.save
      if !save_result
        result_code = 2
        result_msg = 'info is not complete'
      end
    end
    render :json => {'result_code'=>result_code, 'result_msg'=>result_msg}.to_json
  end

  def check
     @result = {"result"=>check_user_exist(params)}
    render :json => @result.to_json
  end

  private

  def check_user_exist(params)
    param= parseimeisnandroidid(params)
    exist = is_user_exist(param)
    return exist
  end

  def is_user_exist(param)
    result = User.find_by_sn_and_androidid_and_imei(param[:sn],param[:androidid],param[:imei])
    exist = !result.nil?
=begin
    if exist
      result.delete
    end
=end
    return exist
  end

  def parseimeisnandroidid(params)
     param = {}
     param[:imei]=params[:imei]
     param[:sn]=params[:sn]
     param[:androidid]=params[:androidid]
     return param
  end
end
