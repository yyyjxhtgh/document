# do not run as root
if test `whoami` == "root"
then
   printf "Script must be run by the functional account, not root"
   exit 1
fi

# kill the running application (if it's currently running)
PID=`ps -ef | grep iq-gateway-service-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
   echo "Killing $PID"
   kill -9 $PID
fi

D1=H
export D1

D2=F
export D2

D3=B
export D3

D4=A
export D4

D5=9
export D5

D6=2
export D6

D7=E
export D7

S1=r
export S1

S2=u
export S2

S3=J
export S3

S4=d
export S4

S5=7
export S5

S6=t
export S6

S7=8
export S7

S8=I
export S8

C1=F
export C1

C2=t
export C2

C3=p
export C3

C4=s
export C4

C5=S
export C5

C6=e
export C6

C7=c
export C7

T1=c
export T1

T2=h
export T2

T3=a
export T3

T4=n
export T4

T5=g
export T5

T6=e
export T6

T7=i
export T7

T8=t
export T8



# start the application
cd /opt/wt/TAS/IQ/gateway/iq-gateway-service/bin
/opt/wt/TAS/jdk-11.0.4/bin/java -DLOG_FILE=/opt/wt/logs/TAS/ -Dlog.level=debug -Dinstance.hostname=$HOSTNAME.nonprod.nb01.local -Djavax.net.ssl.trustStore=/opt/wt/common/certs/TrustSSL.jks -Djavax.net.ssl.trustStorePassword=FtpsSec -Djavax.net.ssl.trustStoreType=jks -Dhttp.netty.maxInitialLineLength=500000 -Djasypt.encryptor.password=IQModernization2021V1 -jar ../iq-gateway-service-0.0.1-SNAPSHOT.jar --spring.cloud.config.uri=https://configadmin:configadmin@nufl2lacsiqa001.nonprod.nb01.local:8888/api/iqservices >/dev/null 2>&1 &
