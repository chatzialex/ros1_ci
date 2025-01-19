- To start Jenkins, do the following in succesion in the same terminal:

```
# Installs the Docker, gives the current user access rights, and configures SSH forwarding rights
~/webpage_ws/setup_docker.sh
# Sets up the .ssh keys
~/webpage_ws/setup_ssh.sh
# Starts Jenkins in the background
~/webpage_ws/jenkins/start_jenkins.sh
```

- The started Jenkins instance can be accessed through the URL provided in the generated `~/jenkins__pid__url.txt`
- The credentials are: `username:admin`, `password:admin`
- The file `~/jenkins__pid__url.txt` also provides instructions on how to kill the running instance.
- The Jenkins webhook URL can be retrieved with:
```
echo "$(jenkins_address)github-webhook/"
```