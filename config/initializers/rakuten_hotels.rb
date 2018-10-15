RakutenWebService.configure do |c|
    # (Required) Appliction ID for your application.
c.application_id = 1089373237716979823

# (Optional) Affiliate ID for your Rakuten account.
c.affiliate_id = '172d7cb9.90e56401.172d7cba.7b448b95' # default: nil

# (Optional) # of retries to send requests when the client receives
# When the number of requests in some period overcomes the limit, the endpoints will return
# too many requests error. Then the client tries to retry to send the same request after a
# while.
c.max_retries = 3 # default: 5

# (Optional) Enable debug mode. When set true, the client streams out all HTTP requests and
# responses to the standard error.
c.debug = true # default: false
end
