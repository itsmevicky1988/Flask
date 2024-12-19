
from predict import app  # Ensure this points to the correct app in predict.py
import pytest

@pytest.fixture
def client():
    return app.test_client()  # Use the test client from the actual app

def test_hello_world(client):
    response = client.get('/')
    assert response.data == b"<p>Hello, World!</p>"
    
def test_pinger(client):
    resp = client.get("/ping")  # Test the /ping route
    assert resp.data == b"<p>Hello i am under water!</p>"
