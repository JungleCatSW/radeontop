cmake_minimum_required(VERSION 3.5)

include("cmake/HunterGate.cmake")
HunterGate(
        URL "https://github.com/ruslo/hunter/archive/v0.16.15.tar.gz"
        SHA1 "6974c2150fc0d3b09de3ad1efcbf15d360647ffa")

project(radeontop)

# sudo apt-get install xutils-dev
# sudo apt-get install libtool

find_package(Curses REQUIRED) #this is installed  on machine
find_package(Threads REQUIRED)
# hunter drm
# DRM includes libpciaccess !
hunter_add_package(drm) #should probably add config required
include_directories(${DRM_ROOT}/include/libdrm ${DRM_ROOT}/include)
link_directories(${DRM_ROOT}/lib)

#XCB
hunter_add_package(xcb)
message(xcbbb ${XCB_ROOT})
#find_package(xcb) #should probably add config required
#add_definitions("-DENABLE_AMDGPU") #need newer drm version :(
#Project Source
include_directories(include)
set(SRC auth.c auth_xcb.c detect.c dump.c family_str.c radeontop.c ticks.c ui.c)

add_executable(${PROJECT_NAME} ${SRC})
target_link_libraries(${PROJECT_NAME} drm pciaccess ncurses xcb xcb-dri2 Xau Threads::Threads m libdrm_amdgpu libdrm_radeon)