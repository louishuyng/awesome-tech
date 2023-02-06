### Running Steps
1. Generate SSH keygen with key name nginx_key `ssh-keygen`
2. run this command `chmod 400 nginx_key`
3. terraform apply
4. Input your public ip address `curl ifconfig.co`
5. Replace output_ip got from output terraform `ssh -i nginx_key ec2-user@output_ip`
