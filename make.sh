#!/bin/bash


IINCLUDE="-I/usr/local/include/opencv -I/usr/local/include -I/usr/include/eigen3/Eigen -I/home/xyz/code1/tbb-2018_U1/include/tbb -I/home/xyz/code1/tbb-2018_U1/include"


LLIBPATH="-L/usr/local/lib -L/home/xyz/code1/DS/deepsort/FeatureGetter -L/home/xyz/code1/tbb-2018_U1/build/linux_intel64_gcc_cc5.4.0_libc2.17_kernel3.10.0_release"

rm DS -rf


function BOPENMP(){
	LLIBS="-lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui -lopencv_video -lopencv_videoio -lFeatureGetter"
	g++ --std=c++14 -fopenmp -o DS $IINCLUDE $LLIBPATH $LLIBS Main.cpp deepsort/munkres/munkres.cpp deepsort/munkres/adapters/adapter.cpp deepsort/munkres/adapters/boostmatrixadapter.cpp  NT.cpp
}


function BTBB(){
	LLIBS="-lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui -lopencv_video -lopencv_videoio -lFeatureGetter -ltbb"
	g++ --std=c++14 -DUSETBB -o DS $IINCLUDE $LLIBPATH $LLIBS Main.cpp deepsort/munkres/munkres.cpp deepsort/munkres/adapters/adapter.cpp deepsort/munkres/adapters/boostmatrixadapter.cpp  NT.cpp
}


BOPENMP



