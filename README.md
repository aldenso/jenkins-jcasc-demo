# jenkins-jcasc-demo

Demo for jenkins with jcasc and docker

```sh
docker build --no-cache -t jenkins:jcasc .
```

```sh
docker run -t -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins01 jenkins:jcasc
```

http://localhost:8080/

username: admin

password: admin
