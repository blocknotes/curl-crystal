require "../curl-crystal"

URL = "https://www.google.com"
OUTPUT = "simple.html"

# Open a file for writing
fp = LibStd.fopen( OUTPUT, "w" )

# CURL init
curl = LibCurl.curl_easy_init

# CURL set options
LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_WRITEDATA, fp
LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, URL
LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_FOLLOWLOCATION, 1

# CURL perform
puts LibCurl.curl_easy_perform curl

# CURL cleanup
LibCurl.curl_easy_cleanup curl

# Close file
LibStd.fclose fp
