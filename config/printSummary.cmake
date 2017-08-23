message( STATUS "None:              ${CMAKE_CXX_FLAGS}" )
message( STATUS "Debug:             ${CMAKE_CXX_FLAGS_DEBUG}" )
message( STATUS "Release:           ${CMAKE_CXX_FLAGS_RELEASE}" )
message( STATUS "RelWithDebInfo:    ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}" )
message( STATUS "MinSizeRel:        ${CMAKE_CXX_FLAGS_MINSIZEREL}" )

# output chosen build options
macro( OptionOutput _outputstring )
    if( ${ARGN} )
        set( _var "YES" )
    else( ${ARGN} )
        set( _var "NO" )
    endif( ${ARGN} )
    message( STATUS "${_outputstring}${_var}" )
endmacro( OptionOutput _outputstring )

message( STATUS "Compiler info: ${CMAKE_CXX_COMPILER_ID} (${CMAKE_CXX_COMPILER}) ; version: ${CMAKE_CXX_COMPILER_VERSION}")

message( STATUS "------------------------------------------------------------------" )
message( STATUS "${PACKAGE_STRING} configure results        <${PACKAGE_URL}>"        )
OptionOutput( "Building PNG support:               " EXIV2_ENABLE_PNG AND ZLIB_FOUND )
OptionOutput( "Building shared library:            " BUILD_SHARED_LIBS               )
OptionOutput( "XMP metadata support:               " EXIV2_ENABLE_XMP                )
OptionOutput( "Building static libxmp:             " EXIV2_ENABLE_LIBXMP             )
OptionOutput( "Native language support:            " EXIV2_ENABLE_NLS                )
OptionOutput( "Conversion of Windows XP tags:      " EXIV2_ENABLE_PRINTUCS2          )
OptionOutput( "Nikon lens database:                " EXIV2_ENABLE_LENSDATA           )
OptionOutput( "Commercial build:                   " EXIV2_ENABLE_COMMERCIAL         )
OptionOutput( "Build the unit tests:               " EXIV2_ENABLE_BUILD_SAMPLES      )
OptionOutput( "Building translations files:        " EXIV2_ENABLE_BUILD_PO           )
OptionOutput( "Building video support:             " EXIV2_ENABLE_VIDEO              )
OptionOutput( "Building webready support:          " EXIV2_ENABLE_WEBREADY           )

if    ( EXIV2_ENABLE_WEBREADY )
    OptionOutput( "USE Libcurl for HttpIo:             " EXIV2_ENABLE_CURL           )
    OptionOutput( "USE Libssh for SshIo:               " EXIV2_ENABLE_SSH            )
endif ( EXIV2_ENABLE_WEBREADY )

if (WIN32)
    OptionOutput( "Dynamic runtime override:           " EXIV2_ENABLE_DYNAMIC_RUNTIME)
    OptionOutput( "Unicode paths (wstring):            " EXIV2_ENABLE_WIN_UNICODE    )
endif()

message( STATUS "------------------------------------------------------------------" )
