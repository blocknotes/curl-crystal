require "./spec_helper"

TEST_VALID_URL = "https://www.google.com"
TEST_INVALID_URL = "https://www.google.commm"

EMPTY_WRITE_FUNCTION = ->( contents : Void*, size : LibC::SizeT, nmemb : LibC::SizeT, userp : Void* ) {size * nmemb}

describe Curl do
  context "using easy library" do
    it "should init the library" do
      curl = LibCurl.curl_easy_init
      curl.should_not eq( nil )
      LibCurl.curl_easy_cleanup curl
    end

    it "should make a valid GET request" do
      curl = LibCurl.curl_easy_init
      LibCurl.curl_easy_setopt( curl, LibCurl::CURLoption::CURLOPT_URL, TEST_VALID_URL ).should eq( LibCurl::CURLcode::CURLE_OK )
      LibCurl.curl_easy_setopt( curl, LibCurl::CURLoption::CURLOPT_WRITEFUNCTION, EMPTY_WRITE_FUNCTION ).should eq( LibCurl::CURLcode::CURLE_OK )
      LibCurl.curl_easy_perform( curl ).should eq( LibCurl::CURLcode::CURLE_OK )
      LibCurl.curl_easy_cleanup curl
    end

    it "should not make a invalid GET request" do
      curl = LibCurl.curl_easy_init
      LibCurl.curl_easy_setopt( curl, LibCurl::CURLoption::CURLOPT_URL, TEST_INVALID_URL ).should eq( LibCurl::CURLcode::CURLE_OK )
      LibCurl.curl_easy_setopt( curl, LibCurl::CURLoption::CURLOPT_WRITEFUNCTION, EMPTY_WRITE_FUNCTION ).should eq( LibCurl::CURLcode::CURLE_OK )
      LibCurl.curl_easy_perform( curl ).should eq( LibCurl::CURLcode::CURLE_COULDNT_RESOLVE_HOST )
      LibCurl.curl_easy_cleanup curl
    end
  end
end
