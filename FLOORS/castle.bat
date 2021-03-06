::castle layout
@echo off
::start sndrec32.exe /play /loop /embedding "MUSIC\castle.wav"
set  line[0]=#######################################
set  line[1]=#.....................................#
set  line[2]=#.....................................#
set  line[3]=#.....................................#
set  line[4]=#......#########......................#
set  line[5]=#......#.......#......................#
set  line[6]=#......#^>.............................#
set  line[7]=#......#.......#......................#
set  line[8]=#......#########......................#
set  line[9]=#.....................................#
set line[10]=#.....................................#
set line[11]=#.....................................#
set line[12]=#.....................................#
set line[13]=#######################################

set stair=8d6
set posts=23

set post1.x=7
set post1.y=4
set post2.x=7
set post2.y=5
set post3.x=7
set post3.y=6
set post4.x=7
set post4.y=7
set post5.x=7
set post5.y=8
set post6.x=8
set post6.y=4
set post7.x=8
set post7.y=8
set post8.x=9
set post8.y=4
set post9.x=9
set post9.y=8
set post10.x=10
set post10.y=4
set post11.x=10
set post11.y=8
set post12.x=11
set post12.y=4
set post13.x=11
set post13.y=8
set post14.x=12
set post14.y=4
set post15.x=12
set post15.y=8
set post16.x=13
set post16.y=4
set post17.x=13
set post17.y=8
set post18.x=14
set post18.y=4
set post19.x=14
set post19.y=8
set post20.x=15
set post20.y=4
set post21.x=15
set post21.y=5
set post22.x=15
set post22.y=7
set post23.x=15
set post23.y=8

set tile_1d1=1
set tile_2d1=1
set tile_3d1=1
set tile_4d1=1
set tile_5d1=1
set tile_6d1=1
set tile_7d1=1
set tile_8d1=1
set tile_9d1=1
set tile_10d1=1
set tile_11d1=1
set tile_12d1=1
set tile_13d1=1
set tile_14d1=1
set tile_15d1=1
set tile_16d1=1
set tile_17d1=1
set tile_18d1=1
set tile_19d1=1
set tile_20d1=1
set tile_21d1=1
set tile_22d1=1
set tile_23d1=1
set tile_24d1=1
set tile_25d1=1
set tile_26d1=1
set tile_27d1=1
set tile_28d1=1
set tile_29d1=1
set tile_30d1=1
set tile_31d1=1
set tile_32d1=1

set tile_1d2=1
set tile_2d2=1
set tile_3d2=1
set tile_4d2=1
set tile_5d2=1
set tile_6d2=1
set tile_7d2=1
set tile_8d2=1
set tile_9d2=1
set tile_10d2=1
set tile_11d2=1
set tile_12d2=1
set tile_13d2=1
set tile_14d2=1
set tile_15d2=1
set tile_16d2=1
set tile_17d2=1
set tile_18d2=1
set tile_19d2=1
set tile_20d2=1
set tile_21d2=1
set tile_22d2=1
set tile_23d2=1
set tile_24d2=1
set tile_25d2=1
set tile_26d2=1
set tile_27d2=1
set tile_28d2=1
set tile_29d2=1
set tile_30d2=1
set tile_31d2=1
set tile_32d2=1

set tile_1d3=1
set tile_2d3=1
set tile_3d3=1
set tile_4d3=1
set tile_5d3=1
set tile_6d3=1
set tile_7d3=1
set tile_8d3=1
set tile_9d3=1
set tile_10d3=1
set tile_11d3=1
set tile_12d3=1
set tile_13d3=1
set tile_14d3=1
set tile_15d3=1
set tile_16d3=1
set tile_17d3=1
set tile_18d3=1
set tile_19d3=1
set tile_20d3=1
set tile_21d3=1
set tile_22d3=1
set tile_23d3=1
set tile_24d3=1
set tile_25d3=1
set tile_26d3=1
set tile_27d3=1
set tile_28d3=1
set tile_29d3=1
set tile_30d3=1
set tile_31d3=1
set tile_32d3=1

set tile_1d4=1
set tile_2d4=1
set tile_3d4=1
set tile_4d4=1
set tile_5d4=1
set tile_6d4=1
set tile_7d4=0
set tile_8d4=0
set tile_9d4=0
set tile_10d4=0
set tile_11d4=0
set tile_12d4=0
set tile_13d4=0
set tile_14d4=0
set tile_15d4=0
set tile_16d4=1
set tile_17d4=1
set tile_18d4=1
set tile_19d4=1
set tile_20d4=1
set tile_21d4=1
set tile_22d4=1
set tile_23d4=1
set tile_24d4=1
set tile_25d4=1
set tile_26d4=1
set tile_27d4=1
set tile_28d4=1
set tile_29d4=1
set tile_30d4=1
set tile_31d4=1
set tile_32d4=1

set tile_1d5=1
set tile_2d5=1
set tile_3d5=1
set tile_4d5=1
set tile_5d5=1
set tile_6d5=1
set tile_7d5=0
set tile_8d5=1
set tile_9d5=1
set tile_10d5=1
set tile_11d5=1
set tile_12d5=1
set tile_13d5=1
set tile_14d5=1
set tile_15d5=0
set tile_16d5=1
set tile_17d5=1
set tile_18d5=1
set tile_19d5=1
set tile_20d5=1
set tile_21d5=1
set tile_22d5=1
set tile_23d5=1
set tile_24d5=1
set tile_25d5=1
set tile_26d5=1
set tile_27d5=1
set tile_28d5=1
set tile_29d5=1
set tile_30d5=1
set tile_31d5=1
set tile_32d5=1

set tile_1d6=1
set tile_2d6=1
set tile_3d6=1
set tile_4d6=1
set tile_5d6=1
set tile_6d6=1
set tile_7d6=0
set tile_8d6=1
set tile_9d6=1
set tile_10d6=1
set tile_11d6=1
set tile_12d6=1
set tile_13d6=1
set tile_14d6=1
set tile_15d6=1
set tile_16d6=1
set tile_17d6=1
set tile_18d6=1
set tile_19d6=1
set tile_20d6=1
set tile_21d6=1
set tile_22d6=1
set tile_23d6=1
set tile_24d6=1
set tile_25d6=1
set tile_26d6=1
set tile_27d6=1
set tile_28d6=1
set tile_29d6=1
set tile_30d6=1
set tile_31d6=1
set tile_32d6=1

set tile_1d7=1
set tile_2d7=1
set tile_3d7=1
set tile_4d7=1
set tile_5d7=1
set tile_6d7=1
set tile_7d7=0
set tile_8d7=1
set tile_9d7=1
set tile_10d7=1
set tile_11d7=1
set tile_12d7=1
set tile_13d7=1
set tile_14d7=1
set tile_15d7=0
set tile_16d7=1
set tile_17d7=1
set tile_18d7=1
set tile_19d7=1
set tile_20d7=1
set tile_21d7=1
set tile_22d7=1
set tile_23d7=1
set tile_24d7=1
set tile_25d7=1
set tile_26d7=1
set tile_27d7=1
set tile_28d7=1
set tile_29d7=1
set tile_30d7=1
set tile_31d7=1
set tile_32d7=1

set tile_1d8=1
set tile_2d8=1
set tile_3d8=1
set tile_4d8=1
set tile_5d8=1
set tile_6d8=1
set tile_7d8=0
set tile_8d8=0
set tile_9d8=0
set tile_10d8=0
set tile_11d8=0
set tile_12d8=0
set tile_13d8=0
set tile_14d8=0
set tile_15d8=0
set tile_16d8=1
set tile_17d8=1
set tile_18d8=1
set tile_19d8=1
set tile_20d8=1
set tile_21d8=1
set tile_22d8=1
set tile_23d8=1
set tile_24d8=1
set tile_25d8=1
set tile_26d8=1
set tile_27d8=1
set tile_28d8=1
set tile_29d8=1
set tile_30d8=1
set tile_31d8=1
set tile_32d8=1

set tile_1d9=1
set tile_2d9=1
set tile_3d9=1
set tile_4d9=1
set tile_5d9=1
set tile_6d9=1
set tile_7d9=1
set tile_8d9=1
set tile_9d9=1
set tile_10d9=1
set tile_11d9=1
set tile_12d9=1
set tile_13d9=1
set tile_14d9=1
set tile_15d9=1
set tile_16d9=1
set tile_17d9=1
set tile_18d9=1
set tile_19d9=1
set tile_20d9=1
set tile_21d9=1
set tile_22d9=1
set tile_23d9=1
set tile_24d9=1
set tile_25d9=1
set tile_26d9=1
set tile_27d9=1
set tile_28d9=1
set tile_29d9=1
set tile_30d9=1
set tile_31d9=1
set tile_32d9=1

set tile_1d10=1
set tile_2d10=1
set tile_3d10=1
set tile_4d10=1
set tile_5d10=1
set tile_6d10=1
set tile_7d10=1
set tile_8d10=1
set tile_9d10=1
set tile_10d10=1
set tile_11d10=1
set tile_12d10=1
set tile_13d10=1
set tile_14d10=1
set tile_15d10=1
set tile_16d10=1
set tile_17d10=1
set tile_18d10=1
set tile_19d10=1
set tile_20d10=1
set tile_21d10=1
set tile_22d10=1
set tile_23d10=1
set tile_24d10=1
set tile_25d10=1
set tile_26d10=1
set tile_27d10=1
set tile_28d10=1
set tile_29d10=1
set tile_30d10=1
set tile_31d10=1
set tile_32d10=1

set tile_1d11=1
set tile_2d11=1
set tile_3d11=1
set tile_4d11=1
set tile_5d11=1
set tile_6d11=1
set tile_7d11=1
set tile_8d11=1
set tile_9d11=1
set tile_10d11=1
set tile_11d11=1
set tile_12d11=1
set tile_13d11=1
set tile_14d11=1
set tile_15d11=1
set tile_16d11=1
set tile_17d11=1
set tile_18d11=1
set tile_19d11=1
set tile_20d11=1
set tile_21d11=1
set tile_22d11=1
set tile_23d11=1
set tile_24d11=1
set tile_25d11=1
set tile_26d11=1
set tile_27d11=1
set tile_28d11=1
set tile_29d11=1
set tile_30d11=1
set tile_31d11=1
set tile_32d11=1

set tile_1d12=1
set tile_2d12=1
set tile_3d12=1
set tile_4d12=1
set tile_5d12=1
set tile_6d12=1
set tile_7d12=1
set tile_8d12=1
set tile_9d12=1
set tile_10d12=1
set tile_11d12=1
set tile_12d12=1
set tile_13d12=1
set tile_14d12=1
set tile_15d12=1
set tile_16d12=1
set tile_17d12=1
set tile_18d12=1
set tile_19d12=1
set tile_20d12=1
set tile_21d12=1
set tile_22d12=1
set tile_23d12=1
set tile_24d12=1
set tile_25d12=1
set tile_26d12=1
set tile_27d12=1
set tile_28d12=1
set tile_29d12=1
set tile_30d12=1
set tile_31d12=1
set tile_32d12=1
goto :eof