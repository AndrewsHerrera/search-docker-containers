# search-docker-containers


## Description
This script helps you to execute any command you want over a specific docker container. It's really useful when you have an ECS cluster and you are using a bastion host, or if you have just a cluster with public IPS.
When you have more than one application running in the same cluster and you want to enter a container it's dificul because you don't know where ECS is going to launch the new containers.
With this script that won't be a headache anymore

## Requirements
AWS CLI

## Install
Before changing the "SSH username example" which is AndrewsHerrera, you can just copy the code from the search.bash file and add it to your ~/.zshrc like in my case or put it whereever you want and call it

## Warning
This script will use the AWS profile that you are connected to by AWS CLI

## How to use it?
Well, this script recieves two parameters, the first one is project_name= and the second one is command=

Here is an example ...
```
project_name=myapp-staging command="rails c" search
```

In this case we set "myapp-staging" as the project_name value so the script will search the first container name that matches with the given value and when this container is found the script is going to run the command you set in "command"
