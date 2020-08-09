# gflags external project
# target:
#  - gflags_ep
# defines:
#  - GFLAGS_HOME
#  - GFLAGS_INCLUDE_DIR
#  - GFLAGS_LIB_DIR

set(GFLAGS_VERSION "2.2.2")
set(GFLAGS_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/external/gflags-install")


set(GFLAGS_URL_MD5 "1a865b93bacfa963201af3f75b7bd64c")

ExternalProject_Add(gflags_ep
        PREFIX external/gflags
        URL "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz"
        URL_MD5 ${GFLAGS_URL_MD5}
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND cmake -DGFLAGS_NAMESPACE=google -DCMAKE_CONFIGURATION_TYPES=Debug -DCMAKE_INSTALL_PREFIX=${GFLAGS_PREFIX} -DBUILD_STATIC_LIBS=ON -DINSTALL_STATIC_LIBS=ON 
        BUILD_COMMAND	MSBuild gflags.sln /t:Rebuild /p:Configuration=Debug
        INSTALL_COMMAND  cmake -P cmake_install.cmake
		)


SET(GFLAGS_HOME ${GFLAGS_PREFIX})
SET(GFLAGS_INCLUDE_DIR ${GFLAGS_HOME}/include)
SET(GFLAGS_LIB_DIR ${GFLAGS_HOME}/lib)