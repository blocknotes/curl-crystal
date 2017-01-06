require "./enums"
require "./types"

lib LibCurl
  fun curl_easy_init(): CURL*
  fun curl_easy_setopt( curl : CURL*, option : CURLoption, ... ): CURLcode
  fun curl_easy_perform( curl : CURL* ): CURLcode
  fun curl_easy_cleanup( curl : CURL* ): Void

  # Request internal information from the curl session with this function.  The
  # third argument MUST be a pointer to a long, a pointer to a char * or a
  # pointer to a double (as the documentation describes elsewhere).  The data
  # pointed to will be filled in accordingly and can be relied upon only if the
  # function returns CURLE_OK.  This function is intended to get used *AFTER* a
  # performed transfer, all results from this function are undefined until the
  # transfer is completed.
  fun curl_easy_getinfo( curl : CURL*, info : CURLINFO, ... ): CURLcode

  # Creates a new curl session handle with the same options set for the handle
  # passed in. Duplicating a handle could only be a matter of cloning data and
  # options, internal state info and things like persistent connections cannot
  # be transferred. It is useful in multithreaded applications when you can run
  # curl_easy_duphandle() for each new thread to avoid a series of identical
  # curl_easy_setopt() invokes in every thread.
  fun curl_easy_duphandle( curl : CURL* ): CURL*

  # Re-initializes a CURL handle to the default values. This puts back the
  # handle to the same state as it was in when it was just created.
  # It does keep: live connections, the Session ID cache, the DNS cache and the
  # cookies.
  fun curl_easy_reset( curl : CURL* ): Void

  # Receives data from the connected socket. Use after successful
  # curl_easy_perform() with CURLOPT_CONNECT_ONLY option.
  fun curl_easy_recv( curl : CURL*, buffer : Void*, buflen : LibC::SizeT, n : LibC::SizeT* ): CURLcode

  # Sends data over the connected socket. Use after successful
  # curl_easy_perform() with CURLOPT_CONNECT_ONLY option.
  fun curl_easy_send( curl : CURL*, buffer : Void*, buflen : LibC::SizeT, n : LibC::SizeT* ): CURLcode
end
