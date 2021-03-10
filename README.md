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

Minimal requirements for testing.

In Folder 'develop' must exists the following credentials id.

| Credential-id | Credential type | Description |
|---------------|-----------------|-------------|
|AZTENANT-DEV | Secret text | Azure Tenant |
|AZSUBSCRIPTION-DEV | Secret text | Azure Subscription |
|AZCLIENT-DEV | Secret text | Azure client ID for Service Principal |
|AZCERTIFICATE-DEV | Secret file | Azure pfx associated with Service Principal |
|AZACCESSKEY-DEV | Secret text | Azure access key for storage account used for terraform backend |

In the remote repositoty [terraform test repo](https://github.com/aldenso/terraform-pipeline-test/blob/main/main.tf) change the backend values.
