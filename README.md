# libcurl for Crystal

Crystal C bindings for libcurl, the multiprotocol file transfer library - see [libcurl](https://curl.haxx.se/libcurl/)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  curl-crystal:
    github: blocknotes/curl-crystal
```

## Usage

```ruby
require "curl-crystal"
curl = LibCurl.curl_easy_init
LibCurl.curl_easy_setopt curl, LibCurl::CURLoption::CURLOPT_URL, "https://www.google.com"
puts LibCurl.curl_easy_perform curl
LibCurl.curl_easy_cleanup curl
```

## More examples

See [examples](https://github.com/blocknotes/curl-crystal/tree/master/examples) folder.

## Contributors

- [Mattia Roccoberton](http://blocknot.es) - creator, maintainer, Crystal fan :)
