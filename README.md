# Example of node-oracledb within Docker

This repo is meant to demonstrate how to move a Node.js app, which depends [node-oracledb](https://github.com/oracle/node-oracledb), within a Docker Image.

You may try it by running:
```
docker pull bchr02/oracledb_example
docker run -d bchr02/oracledb_example
```

However, since there is no Oracle server running within it, it will not output any results.

**Here is how I created it:**

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
