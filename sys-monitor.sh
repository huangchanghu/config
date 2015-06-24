#!/bin/bash

#整理自：http://www.ibm.com/developerworks/cn/linux/l-cn-shell-monitoring/

# 获取pid
GetPID() #User #Name 
{ 
    PsUser=$1 
    PsName=$2 
    pid=`ps -u $PsUser | grep $PsName | grep -v grep | grep -v vi | grep -v dbx | grep -v tail | grep -v start | grep -v stop | sed -n 1p | awk '{print $1}'`  
    echo $pid 
}

#检测进程 CPU 利用率
GetCpu() 
{ 
    CpuValue=`ps -p $1 -o pcpu | grep -v CPU `
    echo $CpuValue%
}

# 获取进程内存用量
GetMem() 
{ 
    MEMUsage=`ps -o vsz -p $1|grep -v VSZ` 
    #MEMUsage=`ps -o vsz -p $1|grep -v VIRT` 
    (( MEMUsage /= 1024)) 
    echo ${MEMUsage}M 
}

# 进程句柄用量
GetDes() 
{ 
    DES=`ls /proc/$1/fd | wc -l` 
    echo $DES 
}

# 查看某个 TCP 或 UDP 端口是否在监听
Listening() 
{ 
    TCPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l` 
    UDPListeningnum=`netstat -an|grep ":$1 " | awk '$1 == "udp" && $NF == "0.0.0.0:*" {print $0}' | wc -l` 
    (( Listeningnum = TCPListeningnum + UDPListeningnum )) 
    if [ $Listeningnum = 0 ] 
    then 
        { 
            echo "false"
        } 
    else 
        { 
            echo "true"
        } 
    fi 
}

# 查看某个进程名正在运行的个数
Runnum()
{
    Runnum=`ps -ef | grep -v vi | grep -v tail | grep "[ /]CFTestApp" | grep -v grep | wc -l`
    echo $Runnum
}

# 检测系统 CPU 负载
GetSysCPU()
{ 
    CpuIdle=`vmstat 1 5 |sed -n '3,$p' | awk '{x = x + $15} END {print x/5}' |awk -F. '{print $1}'`
    CpuNum=`echo "100-$CpuIdle" | bc` 
    echo CPU使用率：$CpuNum%
}

# 检测系统磁盘空间
GetDiskSpc() 
{ 
    if [ $# -ne 1 ]; then 
        echo 用法：GetDiskSpc /mountpoint
        exit 1
    fi 

    Folder="$1$"
    DiskSpace=`df -k |grep $Folder |awk '{print $5}' |awk -F% '{print $1}'`
    echo 已用: $DiskSpace%
}
