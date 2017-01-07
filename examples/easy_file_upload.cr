require "../curl-crystal"

INPUT = "curl.cr"
URL = "http://localhost"

# CURL init
curl = LibCurl.curl_easy_init
if curl
  fd = LibStd.fopen( INPUT, "r" )
  if fd
    len = File.size( INPUT )

    # # CURL set options
    LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, URL
    LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_UPLOAD, 1
    LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_READDATA, fd
    LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_INFILESIZE_LARGE, len
    LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_VERBOSE, 1

    # # CURL perform
    ret = LibCurl.curl_easy_perform curl
    if ret == LibCurl::CURLcode::CURLE_OK
      puts "OK"
      speed_upload = total_time = uninitialized LibC::Double
      LibCurl.curl_easy_getinfo( curl, LibCurl::CURLINFO::CURLINFO_SPEED_UPLOAD, pointerof( speed_upload ) )
      LibCurl.curl_easy_getinfo( curl, LibCurl::CURLINFO::CURLINFO_TOTAL_TIME, pointerof( total_time ) )
      puts "Speed: #{speed_upload} bytes/sec in #{total_time} seconds"
    else
      p ret
    end
  end
  LibStd.fclose fd

  # CURL cleanup
  LibCurl.curl_easy_cleanup curl
end
