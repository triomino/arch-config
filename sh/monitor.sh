if [ $# -eq 0 ]
then
    echo Argument needed: connect or off
    exit 1
fi

if [ $1 == "connect" ] ; then
    xrandr --output DP2 --mode 1920x1080 --output eDP1 --off
fi

if [ $1 == "off" ] ; then
    xrandr --output eDP1 --auto  --output DP2 --off
fi

