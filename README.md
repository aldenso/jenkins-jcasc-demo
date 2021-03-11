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

## Minimal requirements for testing.

The following info must exists.

| Credential-id | Credential type | Description | Filename secret |
|---------------|-----------------|-------------|-----------------|
|AZTENANT-DEV | Secret text | Azure Tenant | secret_tenant |
|AZSUBSCRIPTION-DEV | Secret text | Azure Subscription | secret_subscription |
|AZCLIENT-DEV | Secret text | Azure client ID for Service Principal | secret_clientid |
|AZCERTIFICATE-DEV | Secret file | Azure pfx associated with Service Principal | secret_spcertificatepfx |
|AZACCESSKEY-DEV | Secret text | Azure access key for storage account used for terraform backend | secret_armaccesskey |

We are using a Service Prinpical with certificate, not a secret, also we will use docker secrets for the credentials.

create the files described in the previous table with their correct info.

After the files area created create the docker secrets.

```bash
docker swarm init # in wsl you can't use secrets without swarm
for secret in $(ls secret_*); do
echo "$secret" | docker secret create $secret -
done
```

Start the service.

```bash
docker-compose up -d
```

In the remote repositoty [terraform test repo](https://github.com/aldenso/terraform-pipeline-test/blob/main/main.tf) change the backend values.