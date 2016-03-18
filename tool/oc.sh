oc login https://lab.asiainfodata.com:8443  -u hehl@asiainfo.com  -p 1857e645-c263-407d-b4e1-e82d15df8d6e

oc new-build https://github.com/asiainfoLDP/datafoundry_servicebroker_marathon.git

oc run servicebroker-marathon --image=172.30.32.106:5000/datafoundry-servicebroker/datafoundryservicebrokermarathon  \
    --env  ETCDENDPOINT="http://54.222.175.239:2379"  \
    --env  ETCDUSER="asiainfoLDP" \
	--env  ETCDPASSWORD="6ED9BA74-75FD-4D1B-8916-842CB936AC1A" \
    --env  BROKERPORT="8000"  \
    --env  MONGOURL="54.222.175.239:27017"  \
    --env  MARATHONURL="http://54.222.170.101:5098"

oc expose dc servicebroker-marathon --port 8000
oc expose  svc servicebroker-marathon



oc new-app --name servicebroker-mongo https://github.com/asiainfoLDP/datafoundry_servicebroker_go.git \
    -e  ETCDENDPOINT="http://54.222.175.239:2379"  \
    -e  ETCDUSER="asiainfoLDP" \
	-e  ETCDPASSWORD="6ED9BA74-75FD-4D1B-8916-842CB936AC1A" \
    -e  BROKERPORT="8000"  \
    -e  MONGOURL="54.222.175.239:27017"  \
    -e  MONGOADMINUSER="asiainfoLDP"   \
    -e  MONGOADMINPASSWORD="6ED9BA74-75FD-4D1B-8916-842CB936AC1A"   \
    -e  AWS_ACCESS_KEY_ID=AKIAO2SO52RKIE7BCSHA  \
    -e  AWS_SECRET_ACCESS_KEY=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