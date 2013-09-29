class User < ActiveRecord::Base
  validate :my_validation
  private
  def my_validation
    logger.debug('my_validation')
    if (imei.nil? or imei.empty?) and (sn.nil? or sn.empty?) and (androidid.nil? or androidid.empty?)
       errors[:base] = 'imei, sn, androidid must exist at least one'
       logger.error(errors[:base])
    end
  end

end
