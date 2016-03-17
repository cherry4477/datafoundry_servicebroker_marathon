curl -X GET http://asiainfoLDP:2016asia@localhost:8000/v2/catalog


#########################redis######################

##正确
curl -i -X PUT http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/D8E5D7D2-3510-4B22-9AE7-A2A277327955 -d '{
  "service_id":"885AE7CE-B859-4F75-AEAE-392530F15D73",
  "plan_id":"BBA0DB50-6CEE-4F9D-B10C-6C56E444481A",
  "organization_guid": "org-guid",
  "space_guid":"space-guid",
  "parameters": {"ami_id":"ami-ecb68a84"}
}' -H "Content-Type: application/json"

#测试绑定
##正确的案例，同步模式
curl -i -X PUT http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/D8E5D7D2-3510-4B22-9AE7-A2A277327955/service_bindings/DF3601CF-07DA-46B5-9F86-0F80B250698C -d '{
  "service_id":"885AE7CE-B859-4F75-AEAE-392530F15D73",
  "plan_id":"BBA0DB50-6CEE-4F9D-B10C-6C56E444481A",
  "app_guid":       "app-guid"
}' -H "Content-Type: application/json"

#正确的删除绑定
curl -i -X DELETE 'http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/D8E5D7D2-3510-4B22-9AE7-A2A277327955/service_bindings/DF3601CF-07DA-46B5-9F86-0F80B250698C?service_id=885AE7CE-B859-4F75-AEAE-392530F15D73&plan_id=BBA0DB50-6CEE-4F9D-B10C-6C56E444481A' 
#正确的删除实例
curl -i -X DELETE 'http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/D8E5D7D2-3510-4B22-9AE7-A2A277327955?service_id=885AE7CE-B859-4F75-AEAE-392530F15D73&plan_id=BBA0DB50-6CEE-4F9D-B10C-6C56E444481A' 

#########################es######################

##正确
curl -i -X PUT http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/D1709D-16-4F61-890D-42BF463D22 -d '{
  "service_id":"611D2A65-2824-4E47-85E6-BC53A8528EBB",
  "plan_id":"46266B0D-8C96-47CA-A351-986A655AD522",
  "organization_guid": "org-guid",
  "space_guid":"space-guid",
  "parameters": {"ami_id":"ami-ecb68a84"}
}' -H "Content-Type: application/json"

#测试绑定
##正确的案例，同步模式
curl -i -X PUT http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/DBC70A9D-16EE-4F61-890D-42BF463DEB56/service_bindings/13E56E00-BAC4-45FA-A4C8-9CFDA8AE795E -d '{
  "service_id":"611D2A65-2824-4E47-85E6-BC53A8528EBB",
  "plan_id":"46266B0D-8C96-47CA-A351-986A655AD522",
  "app_guid":       "app-guid"
}' -H "Content-Type: application/json"

#正确的删除绑定
curl -i -X DELETE 'http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/DBC70A9D-16EE-4F61-890D-42BF463DEB56/service_bindings/13E56E00-BAC4-45FA-A4C8-9CFDA8AE795E?service_id=611D2A65-2824-4E47-85E6-BC53A8528EBB&plan_id=46266B0D-8C96-47CA-A351-986A655AD522' 
#正确的删除实例
curl -i -X DELETE 'http://asiainfoLDP:2016asia@localhost:8000/v2/service_instances/DBC70A9D-16EE-4F61-890D-42BF463DEB56?service_id=611D2A65-2824-4E47-85E6-BC53A8528EBB&plan_id=46266B0D-8C96-47CA-A351-986A655AD522' 

