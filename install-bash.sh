#!/bin/bash
if [[ -z $current_Version ]]; then
    echo "正在下载Vultr-Debian11脚本"
    wget --no-cache https://raw.githubusercontent.com/vincilawyer/Bash/main/Vultr-Debian11/Vultr-Debian11.sh -O /usr/local/bin/vinci
    chmod +x /usr/local/bin/vinci
    vinci
else
    if [ "$current_Version" == "force" ]; then
       wget --no-cache https://raw.githubusercontent.com/vincilawyer/Bash/main/Vultr-Debian11/Vultr-Debian11.sh -O /usr/local/bin/vinci
       chmod +x /usr/local/bin/vinci
       echo "强制更新已完成，即将进行管理系统！"
    else
        Version=$(curl -s https://raw.githubusercontent.com/vincilawyer/Bash/main/Vultr-Debian11/Vultr-Debian11.sh | grep 'Version=' | cut -d'=' -f2 | head -1)
        echo "当前版本号$current_Version，最新版本号为$Version"    
        if [[ "${current_Version}" == "${Version}" ]]; then
           echo "当前已是最新版本，无需更新！当前版本为V$Version"
        else
           wget --no-cache https://raw.githubusercontent.com/vincilawyer/Bash/main/Vultr-Debian11/Vultr-Debian11.sh -O /usr/local/bin/vinci
           chmod +x /usr/local/bin/vinci
           echo "已更新至V$Version版本，即将进行管理系统！"
        fi
    fi
    sleep 5
fi
    
