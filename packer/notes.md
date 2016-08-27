When using these Packer .json files in other GCP Projects or Packer solutions in general, there are several key properties to change in each. In the builders section

    "builders": [
      {
        "type": "googlecompute",
        "account_file": "{{user `account_json`}}",
        "project_id": "that-big-universe",
        "source_image": "debian-8-jessie-v20160803",
        "zone": "us-west1-a",
        "instance_name": "{{user `instance_name`}}",
        "image_name": "{{user `image_name`}}",
        "image_description": "Kibana 4.5.",
        "communicator": "ssh",
        "ssh_username": "kibanaadmin"
      }
    ],

change the project_id, source_image, and insure that the account.json file is actually available or a key variable is used to replace it.
