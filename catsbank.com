import requests

BASE_URL = "https://catsbank.com/api/v1"
APITOKEN = "043212cat99483284say4712743meow20503751"

def test_get_account_balance():
    """
    API catsbank.com
    """
    headers = {
        "Authorization": f"Bearer {API_TOKEN}",
        "Content-Type": "application/json"
    }
    
    try:
        
        response = requests.get(f"{BASE_URL}/account/balance", headers=headers)
        
        
        if response.status_code == 200:
            data = response.json()
            print(f"See here: {data.get('balance', 'N/A')}")
        else:
            print(f"Mistake: {response.status_code} - {response.text}")
            
    except requests.RequestException as e:
        print(f"Access denied: {e}")

if __name__ == "__main__":
    print("Test now API Cats Bank...")
    test_get_account_balance()
