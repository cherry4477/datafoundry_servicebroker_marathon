package handler

import (
	//"fmt"
	"errors"
	marathon "github.com/gambol99/go-marathon"
	"github.com/pivotal-cf/brokerapi"
	"time"
	//"strings"
)

type Elasticsearch_sampleHandler struct{}

func (handler *Elasticsearch_sampleHandler) DoProvision(instanceID string, details brokerapi.ProvisionDetails, asyncAllowed bool) (brokerapi.ProvisionedServiceSpec, ServiceInfo, error) {
	//初始化到marathon的链接
	config := marathon.NewDefaultConfig()
	config.URL = marathonUrl
	client, err := marathon.NewClient(config)

	if err != nil {
		return brokerapi.ProvisionedServiceSpec{}, ServiceInfo{}, err
	}

	applicationName := "/servicebroker/" + getguid()

	//否则创建示例
	application := marathon.NewDockerApplication()
	application.Name(applicationName)
	//确定实例参数
	application.CPU(0.5).Memory(1024).Storage(0.0).Count(1)
	application.RequirePorts = true
	application.Container.Docker.Container("elasticsearch").Expose(9200).Expose(9300)

	_, err = client.CreateApplication(application)
	if err != nil {
		return brokerapi.ProvisionedServiceSpec{}, ServiceInfo{}, err
	}

	client.WaitOnApplication(application.ID, 60*time.Second)
	appaddr, err := client.TaskEndpoints(application.ID, 9200, true)
	if err != nil {
		return brokerapi.ProvisionedServiceSpec{}, ServiceInfo{}, err
	}

	if len(appaddr) == 0 {
		return brokerapi.ProvisionedServiceSpec{}, ServiceInfo{}, errors.New("Failed to provision instance on mesos")
	}

	//为dashbord赋值 todo dashboard应该提供一个界面才对
	DashboardURL := "http://" + appaddr[0]

	//赋值隐藏属性
	myServiceInfo := ServiceInfo{
		Url:      DashboardURL,
		Database: applicationName, //用来存储marathon的实例名字
	}

	provsiondetail := brokerapi.ProvisionedServiceSpec{DashboardURL: DashboardURL, IsAsync: false}

	return provsiondetail, myServiceInfo, nil

}

func (handler *Elasticsearch_sampleHandler) DoLastOperation(myServiceInfo *ServiceInfo) (brokerapi.LastOperation, error) {
	//因为是同步模式，协议里面并没有说怎么处理啊，统一反馈成功吧！
	return brokerapi.LastOperation{
		State:       brokerapi.Succeeded,
		Description: "It's a sync method!",
	}, nil
}

func (handler *Elasticsearch_sampleHandler) DoDeprovision(myServiceInfo *ServiceInfo, asyncAllowed bool) (brokerapi.IsAsync, error) {
	//初始化到marathon的链接
	config := marathon.NewDefaultConfig()
	config.URL = marathonUrl
	client, err := marathon.NewClient(config)

	if err != nil {
		return brokerapi.IsAsync(false), err
	}

	applicationName := myServiceInfo.Database

	if _, err := client.Application(applicationName); err == nil {
		_, err = client.DeleteApplication(applicationName)
		return brokerapi.IsAsync(false), nil
	} else {
		return brokerapi.IsAsync(false), err
	}

}

func (handler *Elasticsearch_sampleHandler) DoBind(myServiceInfo *ServiceInfo, bindingID string, details brokerapi.BindDetails) (brokerapi.Binding, Credentials, error) {
	//初始化到marathon的链接
	config := marathon.NewDefaultConfig()
	config.URL = marathonUrl
	client, err := marathon.NewClient(config)

	if err != nil {
		return brokerapi.Binding{}, Credentials{}, err
	}

	applicationName := myServiceInfo.Database

	appaddr, err := client.TaskEndpoints(applicationName, 6379, true)
	if err != nil {
		return brokerapi.Binding{}, Credentials{}, err
	}

	mycredentials := Credentials{
		Uri: "elasticsearch://" + appaddr[0],
	}

	myBinding := brokerapi.Binding{Credentials: mycredentials}

	return myBinding, mycredentials, nil

}

func (handler *Elasticsearch_sampleHandler) DoUnbind(myServiceInfo *ServiceInfo, mycredentials *Credentials) error {
	//没啥好做的

	return nil

}

func init() {
	register("elasticsearch_sample_Sample", &Elasticsearch_sampleHandler{})

}
