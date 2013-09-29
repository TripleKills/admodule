class ApkadController < ApplicationController
  #pkg_name, pic_url, pkg_url, status, weight, allowmobile, size, price, ad_type
  #新建一条广告
  def add
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
  end
end
