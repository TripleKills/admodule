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

  def notify
    #adid, adaction, adcount
    #check ad_id is nil
    if params[:adid].nil? or params[:adaction].nil? or params[:userid].nil? or params[:adchannel].nil?
      render :json => {'result_code'=>2, 'result_msg'=>'parameters error'}.to_json
      return
    end

    #check userid is correct
    begin
      user = User.find(params[:userid])
    rescue
      render :json => {'result_code'=>5, 'result_msg'=>'no this user'}.to_json
      return
    end

    #check ad_id is correct
    begin
      ad = ApkAd.find(params[:adid])
    rescue
      render :json => {'result_code'=>3, 'result_msg'=>'no this ad'}.to_json
      return
    end

    #check adchannel is correct
    begin
      ad = AdChannel.find_by_chvalue(params[:adchannel])
      if ad.nil?
        render :json => {'result_code'=>4, 'result_msg'=>'no this channel'}.to_json
        return
      end
    rescue
      render :json => {'result_code'=>4, 'result_msg'=>'no this channel'}.to_json
      return
    end

    record = AdStats.find_by_adaction_and_adid(params[:adaction], params[:adid])
    result_code = 0
    result_msg = 'success'
    if record.nil?
       sts = AdStats.create(
           :adid => params[:adid],
           :adaction => params[:adaction],
           :adchannel => params[:adchannel],
           :adcount => 1
       )
      begin
        sts.save!
      rescue
        result_code = 1
        result_msg = 'insert fail'
      end
    else
      record.adcount = record.adcount + 1
      begin
        record.save!
      rescue
        result_code = 1
        result_msg = 'insert fail'
      end
    end
    render :json => {'result_code'=>result_code, 'result_msg'=>result_msg}.to_json
  end

  #拿出所有广告，去除用户已有APK的广告，计算总权重，计算每个广告的概率，生成随机数取出某个广告
  def requestad

    #找出用户的安装列表
    s = nil
    if !params[:userid].nil?
      begin
        user = User.find(params[:userid])
        s = user.pkgs unless (user.pkgs.nil? or user.pkgs.empty?)
      rescue
      end
    end

    all_ad = ApkAd.all

    #计算总权重，去除用户已经装过的apk
    hs = Array.new
    total_weight = 0
    all_ad.each do |x|
      if s.nil? or !(s.include?(x.pkg_name))
        hs << x
        total_weight += x.weight
      else
        logger.debug('pkg ' + x.pkg_name + ' is in range, do not add')
      end
    end

    #按权重比从列表重取出一条广告
    random = rand(1..100)
    last_p = 0
    ad = all_ad.first
    hs.each do |x|
       current_p = x.weight * 100 / total_weight  + last_p
       if random < current_p
         ad = x
         break
       else
       last_p = current_p
       end
    end

    render :json=>ad.to_json
  end

  private

  def log_ad_action(params)

  end

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
