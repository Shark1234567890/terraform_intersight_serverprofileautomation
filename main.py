import requests, sys, json

from intersight_auth import IntersightAuth

def make_server_profile(moid, nbservers, apikey, secretkey):
    if server_profile_needed(moid, apikey, secretkey):
        AUTH = IntersightAuth(secret_key_filename=secretkey,
                        api_key_id=apikey)
        BASE_URL='https://www.intersight.com/api/v1'

        targets = []
        for i in range(0, nbservers):
            targets += [{
                "Name":f"demotest{i}-viaTerraformAndPython",
                "ObjectType":"server.Profile",
                "Description":"",
                "Tags":[]
            }]

        url = f"{BASE_URL}/bulk/MoCloners"
        body = {
            "Sources":[
                {
                    "Moid":moid,
                    "ObjectType":"server.ProfileTemplate"
                }
                ],
                "Targets": targets
        }

        resp = requests.post(url, auth=AUTH, data=json.dumps(body))
        resp.raise_for_status()

def server_profile_needed(moid, apikey, secretkey):
    AUTH = IntersightAuth(secret_key_filename=secretkey,
                    api_key_id=apikey)
    BASE_URL='https://www.intersight.com/api/v1'

    url = f"{BASE_URL}/server/Profiles"

    resp = requests.get(url, auth=AUTH)
    resp.raise_for_status()

    for p in resp.json()["Results"]:
        try:
            if p["SrcTemplate"]["Moid"] == moid:
                return False
        except:
            print("no srcTemplate")

    return True

if __name__ == "__main__":
    make_server_profile(sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4])