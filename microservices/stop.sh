# do not run as root
if test `whoami` == "root"
then
   printf "$bold0%s\b" "Script must be run by the functional account, not root"
   printf "$reset"
   exit 1
fi

# kill the running application (if it's currently running)
PID=`ps -ef | grep iq-gateway-service-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
   echo "Killing $PID"
   kill -9 $PID
fi
