cmake_minimum_required(VERSION 3.8)
project(DecoderMp3)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c include libmpadec output.c config.h myprogram/main.c)
add_executable(DecoderMp3 ${SOURCE_FILES})