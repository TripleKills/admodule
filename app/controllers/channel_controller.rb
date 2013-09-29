class ChannelController < ApplicationController
  def index
    if !params.empty?
      result = add_channel(params)
      logger.debug(result)
      @save_result = result['result_code'].to_i
      logger.debug(@save_result)
    end

  end

  private
  def add_channel(params)
    if params[:channel_name].nil? or params[:channel_value].nil?
      return {'result_code'=>3, 'result_msg'=>'parameter error'}
    end

    if check(params)
      return {'result_code'=>2, 'result_msg'=>'channel exist'}
    end

    channel = AdChannel.create(
        :chname => params[:channel_name],
        :chvalue => params[:channel_value]
    )
    channel.chdescrip = params[:channel_description] unless params[:channel_description].nil?
    result_code = 0
    result_msg = 'success'
    begin
      channel.save!
    rescue
      result_code = 1
      result_msg = "save error"
    end
    return {'result_code'=>result_code, 'result_msg'=>result_msg}
  end
  def check(params)
    result = AdChannel.find_by_chvalue(params[:channel_value])
    exist = !result.nil?
    return exist
  end
end
