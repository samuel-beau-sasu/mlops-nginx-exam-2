# Installation des librairie 
pip install joblib numpy fastapi scikit-learn uvicorn

pip freeze | grep -E "^(fastapi|scikit-learn|uvicorn|numpy|joblib)==" > requirements.txt


