# libcurl for Crystal [![Build Status](https://travis-ci.org/blocknotes/curl-crystal.svg)](https://travis-ci.org/blocknotes/curl-crystal)

Crystal C bindings for libcurl, the multiprotocol file transfer library - see [libcurl](https://curl.haxx.se/libcurl/)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  curl-crystal:
    github: blocknotes/curl-crystal
```

## Usage

CURL version:

```ruby
require "curl-crystal"
puts String.new LibCurl.curl_version
```

Fetch an URL an print the content to the STDOUT:

```ruby
require "curl-crystal"
curl = LibCurl.curl_easy_init  # init
LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, "https://www.google.com"  # set URL
LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_FOLLOWLOCATION, 1  # follow redirect
LibCurl.curl_easy_perform curl  # run
LibCurl.curl_easy_cleanup curl  # deinit
```

## More examples

- [examples](https://github.com/blocknotes/curl-crystal/tree/master/examples) folder
- libcurl C [examples](https://curl.haxx.se/libcurl/c/example.html)

## Notes

Base on curl version: **7.52.1**

## Contributors

- [Mattia Roccoberton](http://blocknot.es) - creator, maintainer, Crystal fan :)
