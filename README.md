# Inputs
---
## serverurl
**required**  portainer server url. like this: http://xxx.com:9000

## username
**required**  portainer username

## password
**required**  portainer password

## endpointId
portainer endpoint id, default 1, localhost is 1

## stackname
**required** name of stack

## registry
address of registry, like: myregistry.example.com (leave empty for Docker Hub)

## imagename
**required** name of pull image, like:  mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine

## docker_compose
content of docker-compose.yml.  only support for version: "2" 
```
docker_compose: |
  version: "2"
  services:
  dotnet_test:
    image:  mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
    container_name: dotnet_runtime
```
leave empty for use the current docker-compose file content
    
# Example usage
The following will pull image mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine, and deploy docker-compose to portainer.
```
- name: deploy to portainer
  uses: LGinC/portainer-stack-deploy@master
  with: 
    serverurl: http://xxx.com:9000
    username: ${{ secrets.PORTAINER_USERNAME }}
    password: ${{ secrets.PORTAINER_PASSWORD }}
    endpointId: 1
    stackname: dotnet_test
    registry: mcr.microsoft.com
    imagename: dotnet/core/aspnet:3.1-alpine
    docker_compose: |
      version: "2"
      services:
        dotnet_test:
          image:  mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
          container_name: dotnet_runtime       
```
