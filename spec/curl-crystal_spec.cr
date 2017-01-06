require "./spec_helper"

describe Curl do
  it "should init the library" do
    curl = LibCurl.curl_easy_init
    curl.should_not eq( nil )
    LibCurl.curl_easy_cleanup curl
  end
end
