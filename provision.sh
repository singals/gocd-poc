#!/usr/bin/env bash

case $1 in

    create)
            echo 'provisioning'
            cd infra/terraform
            terraform init
            terraform apply -input=false
            break
            ;;

    destroy)
            echo 'destroying'
#            temporarily sleeping as we don't have deploy and config phase
            sleep 30
            cd infra/terraform
            terraform destroy -auto-approve
            break
            ;;
    *)
            echo 'valid options are ["create", "destroy"]'
esac