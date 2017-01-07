require "../curl-crystal"

URL = "https://www.google.com"
OUTPUT = "easy_url_to_file.html"

# CURL init
curl = LibCurl.curl_easy_init
if curl
  # Open a file for writing
  fd = LibStd.fopen( OUTPUT, "w" )

  # CURL set options
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_WRITEDATA, fd
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, URL
  LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_FOLLOWLOCATION, 1

  # CURL perform
  puts LibCurl.curl_easy_perform curl

  # Close file
  LibStd.fclose fd

  # CURL cleanup
  LibCurl.curl_easy_cleanup curl
end
