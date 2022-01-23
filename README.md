# Hidden.

Hidden fun!

Share your localhost service behind an onion URL using [tor](https://linux.die.net/man/1/tor) and onion routing.

The `h1dd3n.sh` script configure [tor](https://linux.die.net/man/1/tor) package to share your localhost service over all onion routing.

Follow the steps below to make your `web`, `ssh`, `sftp` or `any` other server accessible via the tor network.

### _Install._

Clone repo and enable execution with follow line.

```bash
git clone https://github.com/usrbinbrain/hidden.git && cd hidden && sudo chmod +x h1dd3n.sh
```

***

### _Execution._

Just run the script with localhost port service, the bellow example use service on port 80.

```bash
./h1dd3n.sh 80
```

If [tor](https://linux.die.net/man/1/tor) don't exists the script return this message.

<p align="center">
 <img alt="Execution." src="https://i.imgur.com/jVLNkCJ.png?1" title="Execution." width="45%">
</p>

After run, you have a onion url sharing you service o onion network.

In this example below, the `localhost service` can be accessed by the onion address `vxhcmejdxruwdcfsusrjncfdiel7mkjaryfoluwunymozsa2xftfpeyd.onion` on port `80`.

<p align="center">
 <img alt="Execution." src="https://i.imgur.com/BH9oDk5.png" title="Execution." width="115%">
</p>

Now just access your server/service.

***
