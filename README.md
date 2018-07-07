# gocd-poc
Play ground for Go CD, using the [Pipeline as Code](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html).
See [Github](https://github.com/tomzo/gocd-yaml-config-plugin) repo for the plugin.

This [link](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html) provides good information on the same.


### Running a Go CD server & agent
I am running the Go CD server in a docker container using the following commands.
- For the server:
```sh
> docker run -d -p8153:8153 -p8154:8154 --name=gocd_server gocd/gocd-server:v18.6.0
```

- For the agent:
```sh
> docker run -itd -e GO_SERVER_URL=https://{host-ip}:$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8154/tcp") 0).HostPort}}' gocd_server)/go gocd/gocd-agent-alpine-3.5:v18.6.0
```

Be sure to swap out `{host-ip}` with the IP of the host. Another point to note is that the server container is named
`gocd_server` and we are using the same name to connect the agent in second command.

### Setting up the server & agent
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