#!/bin/bash

export AWS_DEFAULT_REGION=us-east-1

instanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

aws autoscaling update-auto-scaling-group --auto-scaling-group-name Infra-LinuxWebASG-F97JZM2YT9EC --health-check-type EC2

aws elb deregister-instances-from-load-balancer --load-balancer-name LinuxWebELB --instances ${instanceID}

sleep 60
