import requests
import pandas as pd

# Set the API endpoint URL
random_user_url = "https://randomuser.me/api"
genderize_url = "https://api.genderize.io"

# Make the API call to get 20 random users
response = requests.get(random_user_url, params={"results": 20})

# Check the status code to make sure the request was successful
if response.status_code == 200:
    # Get the data from the API response
    data = response.json()
    users = data["results"]

    # Create an empty list to store the data
    user_data = []

    # Iterate through the list of users
    for user in users:
        # Get the user's first name
        first_name = user["name"]["first"]

        # Make the API call to predict the gender of the user
        genderize_response = requests.get(genderize_url, params={"name": first_name})

        # Check the status code to make sure the request was successful
        if genderize_response.status_code == 200:
            # Get the data from the API response
            genderize_data = genderize_response.json()

            # Add the user's data to the list
            user_data.append({
                "name": f"{user['name']['first']} {user['name']['last']}",
                "gender": genderize_data["gender"],
                "probability": genderize_data["probability"]
            })
        else:
            print("Could not predict gender for user.")

    # Create a DataFrame from the list of user data
    df = pd.DataFrame(user_data)
    print(df)

else:
    print("Could not retrieve users.")
