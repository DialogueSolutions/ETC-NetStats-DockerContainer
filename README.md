# bakon-ETC-NetStats-DockerContainer
Run your own ETC NetStats in docker (https://github.com/Machete3000/etc-netstats)

This is actually super straight forward

After eather pulling the image from Docker Hub, or building it from the dockerfile.
`docker pull bakon3/etc-netstats:v.02`
or
`docker build -t bakon3/etc-netstats .`

Make sure you create directory `/.etc-netstats` and copy `startNetstats.sh` into it.

Example command to run docker container from above image:`docker run -tid --name teststats.ethertrack.io -p <port>:6060/tcp -p <port>:6060/udp --mount type=bind,source=$HOME/.etc-netstats,target=/.etc-netstats/ bakon3/etc-netstats:v.02`

As of right now, this will just run the container with netstats pre combiled in it.

After running the container enter it by typing `docker exec -it <containerName> /bin/bash`

Now you should be presented with `bash` wihtin your container. Here you have to do two things.

**First:**

Navigate to `cd ~/etc-netstats/`

**Second:**
run:
*npm install*

To build the full version run
*grunt*

To build the lite version run
*grunt lite*

If you want to build both versions run
*grunt all*

**Third:**

Remember you are sitll inside your docker container, and hopefully still in the `cd ~/etc-netstats/` directory.
In there there is a json file called: `ws_secret.json` make sure you updated your NetStats Password in there clients will need to connect to your server. I have not tried it with blank if clients can connect, but it does warn you on start that `ws_secret` is not set if it's left blank.

**Run**
npm start

see the ETC Stats interface at http://localhost:<port>

To change the port where your page exists on, edit the `app.js` inside the `~/etc-netstats/` directory. It will ltierally be the last thing in the file. Don't worry you'll see it, it looks like this `server.listen(process.env.PORT || 6060);` where `6060` is the new port number.

That's all, at first your stats pages will be blank, it will all populate once at least one node joins.

That's all ENJOY

donate ETC:0xc5bbf1ecdeba58013f17c6ede01aab73a17104a4
