require "../src/curl-crystal"

URL = "https://www.google.com"

EMPTY_WRITE_FUNCTION = ->(contents : Void*, size : LibC::SizeT, nmemb : LibC::SizeT, userp : Void*) { size * nmemb }

# CURL init
curl = LibCurl.curl_easy_init
if curl
  # CURL set options
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, URL
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_FOLLOWLOCATION, 1
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_WRITEFUNCTION, EMPTY_WRITE_FUNCTION

  # CURL perform
  if LibCurl.curl_easy_perform(curl) == LibCurl::CURLcode::CURLE_OK
    content_type = uninitialized LibC::Char*
    if LibCurl.curl_easy_getinfo(curl, LibCurl::CURLINFO::CURLINFO_CONTENT_TYPE, pointerof(content_type)) == LibCurl::CURLcode::CURLE_OK
      puts String.new(content_type)
    end
  end

  # CURL cleanup
  LibCurl.curl_easy_cleanup curl
end
