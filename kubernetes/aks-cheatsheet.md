
## Fake Blog deployment on Azure AKS

> You can run all these commands in the Azure Cloud Shell.

Create the resource group:

```
az group create --name fake-blog --location westeurope
```

Create the AKS cluster and switch the context:

```
az aks create --resource-group fake-blog --name aks1 --node-count 2 --node-vm-size Standard_A1 --generate-ssh-keys

az aks get-credentials --resource-group sc-web --name aks2

```

Now create a secret for your Docker Hub ID:

```
kubectl create secret docker-registry dockerhubkey \
  --docker-username="my-docker-id" \
  --docker-password="a-password" \
  --docker-email="email@address.com"
```

Deploy:

```
kubectl apply -f kubernetes/
```

> For real you'd want to create a Public IP address in the AKS resource group, and then set that IP in the `loadBalancerIP` value in `nginx.yml`.

You're done.