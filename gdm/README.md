Enable a project as the shared VPC host project that will share VPC 

''gcloud compute shared-vpc enable autocomplete-webapp-vpc''

Make project ​ webapp-autocomplete-demo a service project of host project​ webapp-autocomplete-vpc

''gcloud compute shared-vpc associated-projects add autocomplete-webapp-demo --host-project autocomplete-webapp-vpc''

Addin default API service account form webapp-autocomplete-demo to webapp-autocomplete-vpc as network user

''gcloud projects add-iam-policy-binding autocomplete-webapp-vpc --member="serviceAccount:362092375603@cloudservices.gserviceaccount.com" --role="roles/compute.networkUser"''

