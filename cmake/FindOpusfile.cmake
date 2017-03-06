find_package(PkgConfig QUIET)
pkg_check_modules(PC_OPUSFILE opusfile)
set_extra_dirs(OPUSFILE opus)

find_path(OPUSFILE_INCLUDEDIR opusfile.h
  PATH_SUFFIXES opus
  HINTS ${PC_OPUSFILE_INCLUDEDIR} ${PC_OPUSFILE_INCLUDE_DIRS}
  PATHS ${EXTRA_OPUSFILE_INCLUDEDIR}
)
find_library(OPUSFILE_LIBRARY
  NAMES opusfile
  HINTS ${PC_OPUSFILE_LIBDIR} ${PC_OPUSFILE_LIBRARY_DIRS}
  PATHS ${EXTRA_OPUSFILE_LIBDIR}
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Opusfile DEFAULT_MSG OPUSFILE_LIBRARY OPUSFILE_INCLUDEDIR)

mark_as_advanced(OPUSFILE_LIBRARY OPUSFILE_INCLUDEDIR)

set(OPUSFILE_LIBRARIES ${OPUSFILE_LIBRARY})
set(OPUSFILE_INCLUDE_DIRS ${OPUSFILE_INCLUDEDIR})