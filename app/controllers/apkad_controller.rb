class ApkadController < ApplicationController
  #pkg_name, pic_url, pkg_url, status, weight, allowmobile, size, price, type
  def add
    apk_ad = ApkAd.create(
        :pkg_name=>params[:pkg_name],
        :pic_url=>params[:pic_url],
        :pkg_url=>params[:pkg_url],
        :status=>params[:status],
        :weight=>params[:weight],
        :allowmobile=>params[:allowmobile],
        :size=>params[:size],
        :price=>params[:price],
        :type=>params[:type]
    )
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
