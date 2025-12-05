# Writeup 3: Data

Name: Tara Eustis

ID: teustis

## Google Authentication

This was very straight forward to do. 
<img width="1615" height="282" alt="image" src="https://github.com/user-attachments/assets/4990a574-5805-4f02-8c71-eae2220cb988" />

## Rclone Remote

This took significant time ~2hrs because the instructions were a bit confusing to me and the login rclone needed kept being invalid. I fixed it by figuring out to put the credentials file as the service account file.

<img width="496" height="433" alt="image" src="https://github.com/user-attachments/assets/0d03dfb8-ee16-4e29-814f-7751741e1dae" />

## Database Creation

<img width="1569" height="533" alt="image" src="https://github.com/user-attachments/assets/e80b8666-cf81-47b3-91f3-4044d48e10c4" />

### Questions

How many tables will be created in the database?

3, one for gff, one for protein cluster, and one for metadata

In the insert_gff_table.py script you submitted, explain the logic of using try and except. Why is this necessary?

This logic is because sql only allows you to write one thing at a time, so this basically continutes to try to write until it is free or a different error occurs.

## Database Query

<img width="642" height="115" alt="image" src="https://github.com/user-attachments/assets/68a62d41-442a-4406-aa33-fee7f5e5990b" />

Uncommenting db.index_records_id() makes it run considerably faster as this allows for it to just know the right lines rather than having to access them all and index each time it needs to call something. 

<img width="430" height="52" alt="image" src="https://github.com/user-attachments/assets/0d3df55f-272e-4aaf-b0a4-513c07b4afa9" />


## Up to this point took me ~6hrs of troubleshooting so based on the reccomendation in class to stop after ~1hr of work I am stopping here.
