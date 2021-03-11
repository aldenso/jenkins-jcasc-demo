# jenkins-jcasc-demo

Demo for jenkins with jcasc and docker

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

Open your browser and play with it.

http://localhost:8080/

username: admin

password: admin

In the remote repositoty [terraform test repo](https://github.com/aldenso/terraform-pipeline-test/blob/main/main.tf) change the backend values.
