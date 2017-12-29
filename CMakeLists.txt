cmake_minimum_required(VERSION 2.8.3)
project(gtsam_catkin)

find_package(catkin_simple REQUIRED)

find_package(eigen_catkin REQUIRED)

catkin_simple()

include(ExternalProject)
file(MAKE_DIRECTORY ${CATKIN_DEVEL_PREFIX}/include)
ExternalProject_Add(gtsam_src
  GIT_REPOSITORY https://bitbucket.org/gtborg/gtsam.git
  GIT_TAG release/3.2.1
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=${CATKIN_DEVEL_PREFIX}
    -DGTSAM_USE_SYSTEM_EIGEN=ON
    -DEIGEN3_INCLUDE_DIR=${eigen_catkin_INCLUDE_DIRS}
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
)

cs_install()
cs_export(CFG_EXTRAS gtsam-extras.cmake)
