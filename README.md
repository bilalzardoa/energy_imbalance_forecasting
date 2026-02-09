# energy_imbalance_forecasting
baseline project voor stage
# use case

# activate venv
## powershell
.\venv\Scripts\Activate.ps1

## linux/bash
source venv/bin/activate

# set GCP credentials
$env:GOOGLE_APPLICATION_CREDENTIALS="C:\Users\zardo\Downloads\if-playground-4245acdeed4b.json"

# Variabelen instellen
export PROJECT_ID="if-playground"
export REGION="europe-west1"

# Authenticeren
gcloud auth configure-docker ${REGION}-docker.pkg.dev

# Build de image (vanuit je project root)
docker build -t ${REGION}-docker.pkg.dev/${PROJECT_ID}/ml-repo/mnist-model:latest .

# Push naar Artifact Registry
docker push ${REGION}-docker.pkg.dev/${PROJECT_ID}/ml-repo/mnist-model:latest