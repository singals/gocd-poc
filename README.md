# gocd-poc
Play ground for Go CD, using the [Pipeline as Code](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html).
See [Github](https://github.com/tomzo/gocd-yaml-config-plugin) repo for the plugin.


### Running a Go CD server
I am running the Go CD server in a docker container using the following command : 
> docker run -d -p8153:8153 -p8154:8154 gocd/gocd-server:v18.6.0