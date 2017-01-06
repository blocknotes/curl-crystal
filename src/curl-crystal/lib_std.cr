@[Link("c")]
lib LibStd
  type FilePtr = Void*

  fun fopen( LibC::Char*, LibC::Char* ): FilePtr
  fun fputs( LibC::Char*, FilePtr )
  fun fclose( FilePtr )
end
