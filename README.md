# How to get started with terraform and GCP

### Install gloud

```
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init
```
### Get account credentials




### Get Kubernetes Credentials
```
gcloud container clusters get-credentials yourclustername --zone us-west1-a --project yourprojectname
kubectl get nodes
gcloud compute --project "yourprojectname" ssh --zone "us-west1-c" "gke-epic-default-pool-xxxxxxxxxxxxx"
```
