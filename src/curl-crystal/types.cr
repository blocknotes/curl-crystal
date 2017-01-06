require "./enums"

lib LibCurl
  # typedef struct Curl_easy CURL;  # TODO
  # typedef struct Curl_share CURLSH;  # TODO

  type CURL = Void
  type CURLSH = Void
  type CurlHttppost = Void
  type CurlSlist = Void

  type CurlFormgetCallback = Void*, LibC::Char*, LibC::SizeT -> LibC::SizeT

  # The following typedef's are signatures of malloc, free, realloc, strdup and
  # calloc respectively.  Function pointers of these types can be passed to the
  # curl_global_init_mem() function to set user defined memory management
  # callback routines.
  type CurlMallocCallback = LibC::SizeT -> Void*
  type CurlFreeCallback = Void* -> Void
  type CurlReallocCallback = Void*, LibC::SizeT -> Void*
  type CurlStrdupCallback = LibC::Char* -> LibC::Char*
  type CurlCallocCallback = LibC::SizeT, LibC::SizeT -> Void*

  struct CurlVersionInfoData
    age : CURLversion             # age of the returned struct
    version : LibC::Char*         # LIBCURL_VERSION
    version_num : LibC::UInt      # LIBCURL_VERSION_NUM
    host : LibC::Char*            # OS/host/cpu/machine when configured
    features : LibC::Int          # bitmask, see defines below
    ssl_version : LibC::Char*     # human readable string
    ssl_version_num : LibC::Long  # not used anymore, always 0
    libz_version : LibC::Char*    # human readable string
    # protocols is terminated by an entry with a NULL protoname
    protocols : LibC::Char**

    # The fields below this were added in CURLVERSION_SECOND
    ares : LibC::Char*
    ares_num : LibC::Int

    # This field was added in CURLVERSION_THIRD
    libidn : LibC::Char*

    # These field were added in CURLVERSION_FOURTH

    # Same as '_libiconv_version' if built with HAVE_ICONV
    iconv_ver_num : LibC::Int

    libssh_version : LibC::Char* # human readable string
  end

end
