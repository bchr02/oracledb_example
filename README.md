# Example of node-oracledb within Docker

This repo is meant to demonstrate how to move a Node.js app, which depends [node-oracledb](https://github.com/oracle/node-oracledb), within a Docker Image.

## You may try this example with these steps:

1. [Download](https://github.com/bchr02/oracledb_example/archive/master.zip) and extract this repo into a folder.
2. open a command prompt to that folder
3. edit [lines 16-18 within app.js](https://github.com/bchr02/oracledb_example/blob/master/app.js#L16-L18) and change the username, password and connectString so that it matches your environment. Also, change the query on [line 25](https://github.com/bchr02/oracledb_example/blob/master/app.js#L25) to something that will work with your database.
3. ```docker build -t test/oracledb_example .```
4. ```docker run -d test/oracledb_example```

Now if you check the logs you should see the results of your query. ```docker logs CONTAINERID```

## Here is how I created this example:

1. create a new app folder. I will refer to this folder as your app folder.
2. copy [Dockerfile](https://github.com/bchr02/oracledb_example/blob/master/Dockerfile) into your app folder
3. copy the rest of your Node.JS app into your app folder
4. within the app folder create another folder titled oracle and within that folder create another folder titled instantclient
5. download the the free Basic and SDK ZIPs from [Oracle Technology Network](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html)
6. extract the contents of both ZIPs into the instantclient folder

**If you plan to push to a git repository you must use Git Large File Storage for the Oracle libraries because GitHub goesn't allow files larger than 50MB or totaling over 100MBs. Therefore, before you ```git add``` you must:**

1. be sure to have Git Large File Storage installed (free)
2. once Git LFS is installed, you must run ```git lfs install```. This only needs to be done once per machine.
3. from within the app folder run ```git lfs track "oracle/**/*"``` this will allow the large files within the oracle folder to be pushed and not get errors such as these:
```this exceeds GitHub's file size limit of 100.00 MB```
4. now you can ```git add -A``` and then ```git commit -m "First Commit"```
