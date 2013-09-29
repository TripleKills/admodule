class ApkAd < ActiveRecord::Base
  #pkg_name, pic_url, pkg_url, status, weight, allowmobile, size, price, type
  #price要大于0,allowmobile只能是yes或no,weight要大于0,status只能是open,test,close这三种状态，size要大于0
  #pkg_name, pic_url, pkg_url, price, size必须不为空
  validates_presence_of :pkg_name, :pic_url, :pkg_url, :price, :size, :message=>'some one not presence'
  validates_numericality_of :price, :greater_than => 0,   :message=>'lower than 0'
  validates_numericality_of :size, :greater_than => 0,  :message=>'lower than 0'
  validates_format_of :pkg_url, :with =>  /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  validates_format_of :pic_url, :with =>  /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

  validate :my_validation
  private
  def my_validation
    logger.debug('my_apk_ad_validation')
    if !weight.nil?
      validates_numericality_of :weight, :greater_than => 0, :message=>'lower than 0'
    end
    if !status.nil?
      validates_inclusion_of :status, :in => ["open", "test", "close"]
    end
    if !allowmobile.nil?
      validates_inclusion_of :allowmobile, :in => ["yes", "no"]
    end
  end
end
