# gocd-poc
Play ground for Go CD, using the [Pipeline as Code](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html).
See [Github](https://github.com/tomzo/gocd-yaml-config-plugin) repo for the plugin.

This [link](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html) provides good information on the same.


### Prerequisites (For dev):
1. **Docker** for running almost everything (tested on version `18.03.1-ce, build 9ee9f40`)
2. **Node.js** (tested on `v10.6.0`)
3. **Terraform** `v0.11.7`
4. An **AWS** account. (Free tier shall be good enough but check before you use. I will not be responsible for 
any charges from AWS.)


### Building/Running the application:
- Execute command from root of the project to build the docker image:
>  docker build -t singals/gocd-poc-node .

Once this is successful, run the image using following command:
> docker run -d -p8080:8080 singals/gocd-poc-node

Verification: `curl localhost:8080` shall produce `Hello World!`

### Running a Go CD server & agent
I am running the Go CD server in a docker container using the following commands.
- For the server:
> docker run -d -p8153:8153 -p8154:8154 --name=gocd_server gocd/gocd-server:v18.6.0

- For the agent:

TODO: Replace alpine agent by ubuntu agent and the set up the basic softwares on it.
> docker run -itd -e GO_SERVER_URL=https://{host-ip}:$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8154/tcp") 0).HostPort}}' gocd_server)/go gocd/gocd-agent-alpine-3.5:v18.6.0

Be sure to swap out `{host-ip}` with the IP of the host. Another point to note is that the server container is named
`gocd_server` and we are using the same name to connect the agent in second command.

### Setting up the Go CD server & agent
Once the server is up on http://localhost:8153.

- Add the following to the `Admin`>`Config XML`:
```sh
<config-repos>
    <config-repo pluginId="yaml.config.plugin" id="gocd-yaml-config-example">
        <git url="https://github.com/singals/gocd-poc.git" />
    </config-repo>
</config-repos>
```

- Go to the `AGENTS` tab and do the following
1. Set the environment as `test`
2. Enable the Agent

## About the App

We are using Node.js to spin up a basic minimalistic server. Terraform to provision and Ansible to setup the configurations. 