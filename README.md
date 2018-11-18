# How to get started with terraform and GCP

### Install gloud

```
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init

create a new project 
enable the kubernetes engine
```
### Get account credentials

```
https://console.cloud.google.com/

Go to APIs and Services - Click on Credentials and create your account.json and put it in a folder where terraform can access it.
```

### Get Kubernetes Credentials
```
gcloud container clusters get-credentials yourclustername --zone us-west1-a --project yourprojectname
kubectl get nodes
gcloud compute --project "yourprojectname" ssh --zone "us-west1-c" "gke-epic-default-pool-xxxxxxxxxxxxx"
```
### Grant current user cluster-admin role
```
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)
```
