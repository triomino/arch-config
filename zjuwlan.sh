sudo iw dev wlp3s0 scan | egrep "signal:|SSID:|(BSS [a-z0-9][a-z0-9]:[a-z0-9])" | sed -e "s/\tSSID: //" -e "s/\tsignal: //" -e "s/BSS //" -e "s/(on wlp3s0)//" | awk 'NR % 3 == 2 {print} NR % 3 == 1 {delay = $0} NR % 3 == 0 {print; print delay; delay=""}' | awk '{ORS = (NR % 3 == 0) ? " \n" : " "; print}' | sort > wifi_list.txt
IFS=' '
WIFI_ID=NULL
while read p; do
    # echo "$p"
    read -a strarr <<< "$p"
    for val in "${strarr[@]}";
    do
        if [ "$val" == "ZJUWLAN" ]; then
            WIFI_ID=${strarr[3]}
        fi
    done
    if [ $WIFI_ID != NULL ]; then
        echo $WIFI_ID
        sudo iw dev wlp3s0 connect "ZJUWLAN" $WIFI_ID
        break
    fi
done <wifi_list.txt
