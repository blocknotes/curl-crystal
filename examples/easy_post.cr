require "../curl-crystal"

# Create a simple PHP script like: <pre><?php var_dump( $_POST ); ?></pre>
# And start listening: php -S 0.0.0.0:80
URL = "http://localhost"

# CURL init
curl = LibCurl.curl_easy_init
if curl
  str = "param1=Just+a+test&param2=12.34"

  # CURL set options
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, URL
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_POSTFIELDS, str

  # CURL perform
  puts LibCurl.curl_easy_perform curl

  # CURL cleanup
  LibCurl.curl_easy_cleanup curl
end
