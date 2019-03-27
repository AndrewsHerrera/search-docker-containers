search(){
  #!/bin/bash
  username=AndrewsHerrera
  ips_file_path=~/instance_ips
  ec2_instance_ips=$(aws ec2 describe-instances | grep PublicIpAddress | awk '{ print $2 }' | cut -d '"' -f 2)
  if [ -n "$ec2_instance_ips" ]
  then
    echo $ec2_instance_ips > $ips_file_path
    while read instance_ip
    do
      container_id=$(ssh -o "StrictHostKeyChecking no" -n $username@$instance_ip docker ps | grep $project_name | head -n 1 | awk '{ print $1 }')
      if [ -n "$container_id" ]
      then
        echo "EC2 Instance IP: $instance_ip"
        break
      fi
    done < $ips_file_path
    if [ -n "$container_id" ]
    then
      ssh -t $username@$instance_ip docker exec -it $container_id $command
    fi
  fi
}
