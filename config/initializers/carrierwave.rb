CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV['EJHtexDOjXSi_yKrOHRlzrraWtEq2D38X9GJKNHT']
  config.qiniu_secret_key    = ENV['jaacyqkWdsdXbKOZuszUbI5Z_ETtCLGGDc-azo9i']
  config.qiniu_bucket        = ENV['bgw-jdstore']
  config.qiniu_bucket_domain = ENV['oqyn5ink5.bkt.clouddn.com']
  config.qiniu_block_size    = 4 * 1024 * 1024
  config.qiniu_protocol      = 'http'
  config.qiniu_up_host       = 'http://up.qiniug.com' # 选择不同的区域时，"up.qiniug.com" 不同
end
