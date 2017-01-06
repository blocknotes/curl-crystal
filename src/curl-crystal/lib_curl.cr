require "./enums"
require "./types"

@[Link("curl")]
lib LibCurl
  # Pretty advanced function for building multi-part formposts. Each invoke
  # adds one part that together construct a full post. Then use
  # CURLOPT_HTTPPOST to send it off to libcurl.
  fun curl_formadd( httppost : CurlHttppost**, last_post : CurlHttppost**, ... ): CURLFORMcode

  # Serialize a curl_httppost struct built with curl_formadd().
  # Accepts a void pointer as second argument which will be passed to
  # the curl_formget_callback function.
  # Returns 0 on success.
  fun curl_formget( form : CurlHttppost*, arg : Void*, append : CurlFormgetCallback ): LibC::Int

  # Free a multipart formpost previously built with curl_formadd().
  fun curl_formfree( form : CurlHttppost* ): Void

  # Returns a malloc()'ed string that MUST be curl_free()ed after usage is
  # complete. DEPRECATED - see lib/README.curlx
  fun curl_getenv( variable : LibC::Char* ): LibC::Char*

  # Returns a static ascii string of the libcurl version.
  fun curl_version(): LibC::Char*

  # Escapes URL strings (converts all letters consider illegal in URLs to their
  # %XX versions). This function returns a new allocated string or NULL if an
  # error occurred.
  ## CURL_EXTERN char *curl_easy_escape(CURL *handle, const char *string, int length);
  fun curl_easy_escape( handle : CURL*, string : LibC::Char*, length : LibC::Int ): LibC::Char*

  # Unescapes URL encoding in strings (converts all %XX codes to their 8bit
  # versions). This function returns a new allocated string or NULL if an error
  # occurred.
  # Conversion Note: On non-ASCII platforms the ASCII %XX codes are
  # converted into the host encoding.
  fun curl_easy_unescape( handle : CURL*, string : LibC::Char*, length : LibC::Int, outlength : LibC::Int* ): LibC::Char*

  # the previous version
  fun curl_unescape( string : LibC::Char*, length : LibC::Int ): LibC::Char*

  # Provided for de-allocation in the same translation unit that did the
  # allocation. Added in libcurl 7.10
  fun curl_free( p : Void* ): Void

  # curl_global_init() should be invoked exactly once for each application that
  # uses libcurl and before any call of other libcurl functions.
  #
  # This function is not thread-safe!
  fun curl_global_init( flags : LibC::Long ): CURLcode

  # curl_global_init() or curl_global_init_mem() should be invoked exactly once
  # for each application that uses libcurl.  This function can be used to
  # initialize libcurl and set user defined memory management callback
  # functions.  Users can implement memory management routines to check for
  # memory leaks, check for mis-use of the curl library etc.  User registered
  # callback routines with be invoked by this library instead of the system
  # memory management routines like malloc, free etc.
  fun curl_global_init_mem( flags : LibC::Long, m : CurlMallocCallback, f : CurlFreeCallback, r : CurlReallocCallback, s : CurlStrdupCallback, c : CurlCallocCallback ): CURLcode

  # curl_global_cleanup() should be invoked exactly once for each application
  # that uses libcurl
  fun curl_global_cleanup(): Void

  # Appends a string to a linked list. If no list exists, it will be created
  # first. Returns the new list, after appending.
  ## CURL_EXTERN struct curl_slist *curl_slist_append(struct curl_slist *, const char *);
  fun curl_slist_append( curl_slist : CurlSlist*, cp : LibC::Char* ): CurlSlist*

  # free a previously built curl_slist.
  fun curl_slist_free_all( curl_slist : CurlSlist* ): Void

  # Returns the time, in seconds since 1 Jan 1970 of the time string given in
  # the first argument. The time argument in the second parameter is unused
  # and should be set to NULL.
  fun curl_getdate( cp : LibC::Char*, unused : LibC::TimeT* ): LibC::TimeT

  fun curl_share_init(): CURLSH
  fun curl_share_setopt( curlsh : CURLSH*, option : CURLSHoption, ... ): CURLSHcode
  fun curl_share_cleanup( curlsh : CURLSH* ): CURLSHcode

  # This function returns a pointer to a static copy of the version info
  # struct. See above.
  ## CURL_EXTERN curl_version_info_data *curl_version_info(CURLversion);
  fun curl_version_info( version : CURLversion ) : CurlVersionInfoData*

  # The curl_easy_strerror function may be used to turn a CURLcode value
  # into the equivalent human readable error string.  This is useful
  # for printing meaningful error messages.
  fun curl_easy_strerror( code : CURLcode ): LibC::Char*

  # The curl_share_strerror function may be used to turn a CURLSHcode value
  # into the equivalent human readable error string.  This is useful
  # for printing meaningful error messages.
  fun curl_share_strerror( code : CURLSHcode ): LibC::Char*

  # The curl_easy_pause function pauses or unpauses transfers. Select the new
  # state by setting the bitmask, use the convenience defines below.
  fun curl_easy_pause( handle : CURL*, bitmask : LibC::Int ): CURLcode
end
