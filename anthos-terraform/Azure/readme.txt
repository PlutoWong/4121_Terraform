Steps to apply terraform:
1. Install azure cli follow the steps 1-4( https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt )

2. az login --use-device-code -> login azure  and type the code show in gcp cli 

3. check your google cli login or not first, if not than login; 
if login than turn on the service api first->
gcloud --project="your project id" services enable \
gkemulticloud.googleapis.com \
gkeconnect.googleapis.com \
connectgateway.googleapis.com \
cloudresourcemanager.googleapis.com \
anthos.googleapis.com \
logging.googleapis.com \
monitoring.googleapis.com

4.if all terraform setting finish -> terraform init || plan || apply

5. finally, if apply success remember destory
