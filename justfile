# 必要な変数の設定
GCP_REGION := env_var_or_default('GCP_REGION', 'us-west1')
GCP_PROJECT_ID := env_var_or_default('GCP_PROJECT_ID', '')
ARTIFACT_REGISTRY := env_var_or_default('ARTIFACT_REGISTRY', '')
IMAGE_NAME := env_var_or_default('IMAGE_NAME', 'n8n')

# Dockerイメージをビルド
build:
    docker build -t {{GCP_REGION}}-docker.pkg.dev/{{GCP_PROJECT_ID}}/{{ARTIFACT_REGISTRY}}/{{IMAGE_NAME}} --platform linux/amd64 .

# Dockerイメージをビルド（キャッシュなし）
build-no-cache:
    docker build --no-cache -t {{GCP_REGION}}-docker.pkg.dev/{{GCP_PROJECT_ID}}/{{ARTIFACT_REGISTRY}}/{{IMAGE_NAME}} --platform amd64 .

# Artifact Registryにイメージをプッシュ
push:
    docker push {{GCP_REGION}}-docker.pkg.dev/{{GCP_PROJECT_ID}}/{{ARTIFACT_REGISTRY}}/{{IMAGE_NAME}}

# ビルドしてプッシュ
build-push: build push
