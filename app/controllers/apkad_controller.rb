class ApkadController < ApplicationController
  #pkg_name, pic_url, pkg_url, status, weight, allowmobile, size, price, ad_type
  #新建一条广告
  def add
=begin
    apk_ad = ApkAd.create(
        :pkg_name=>params[:pkg_name],
        :pic_url=>params[:pic_url],
        :pkg_url=>params[:pkg_url],
        :size=>params[:size],
        :price=>params[:price]
    )
    apk_ad[:weight]   = params[:weight] unless params[:weight].nil?
    apk_ad[:allowmobile]   = params[:allowmobile] unless params[:allowmobile].nil?
    apk_ad[:ad_type]   = params[:ad_type] unless params[:ad_type].nil?
    apk_ad[:status]   = params[:status] unless params[:status].nil?
    result_code = 0
    result_msg = 'success'
    begin
      apk_ad.save!
    rescue ActiveRecord::RecordInvalid
      result_code = 1
      result_msg = "#{$!}"
    end
    render :json=>{'result_code'=>result_code, 'result_msg'=>result_msg}
=end
    render :json=>add_ad(params)
  end

  def addview
    if !params.empty?
        if params[:allowmobile] == 'on'
          params[:allowmobile] = 'yes'
        else
          params[:allowmobile] = 'no'
        end
        result = add_ad(params)
        logger.debug(result)
        @save_result = result['result_code'].to_i
        logger.debug(@save_result)
    end
  end

  private
  def add_ad(params)
    if check(params)
      return {'result_code'=>2, 'result_msg'=>'ad exist'}
    end
    apk_ad = ApkAd.create(
        :pkg_name=>params[:pkg_name],
        :pic_url=>params[:pic_url],
        :pkg_url=>params[:pkg_url],
        :size=>params[:size],
        :price=>params[:price]
    )
    apk_ad[:weight]   = params[:weight] unless params[:weight].nil?
    apk_ad[:allowmobile]   = params[:allowmobile] unless params[:allowmobile].nil?
    apk_ad[:ad_type]   = params[:ad_type] unless params[:ad_type].nil?
    apk_ad[:status]   = params[:status] unless params[:status].nil?
    result_code = 0
    result_msg = 'success'
    begin
      apk_ad.save!
    rescue ActiveRecord::RecordInvalid
      result_code = 1
      result_msg = "#{$!}"
      logger.error(result_msg)
    end
    return {'result_code'=>result_code, 'result_msg'=>result_msg}
  end

  def check(params)
    result = ApkAd.find_by_pkg_name_and_ad_type_and_pkg_url_and_pic_url(params[:pkg_name],params[:ad_type],params[:pkg_url],params[:pic_url])
    exist = !result.nil?
    return exist
  end
end
