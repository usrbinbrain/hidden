# Hidden.


[<img alt="alt_text" width="35px" src="https://cdn0.iconfinder.com/data/icons/flat-round-system/512/tor-512.png" />](https://linux.die.net/man/1/tor/) 
[<img alt="alt_text" width="35px" src="https://awesomeopensource.com/awesome.gif" />](https://awesomeopensource.com/project/usrbinbrain/hidden/)

Hidden fun!

The [`h1dd3n.sh`](https://github.com/usrbinbrain/hidden/blob/master/h1dd3n.sh) script share your `GNU/Linux` localhost service behind an onion URL using [`tor`](https://linux.die.net/man/1/tor) and onion routing.

All configuration steps are performed automatically, just needing that the service you want to share is working correctly.

Follow the steps below to make your `http`, `ssh`, `sftp` or `any` other server accessible via the tor network.

### _Install._ ⚙️

The following commands clone this project via git and add execution permission to the script.

```bash
git clone https://github.com/usrbinbrain/hidden.git && cd hidden && sudo chmod +x h1dd3n.sh
```

***

### _Execution._ 🧅

Just run the script passing the `localhost port` of the service you want to make available on the `onion network`.

In the following example a simple web server that is running on port `80` of my `localhost` will be available.

```bash
./h1dd3n.sh 80
```

 - If [`tor`](https://linux.die.net/man/1/tor) don't exists in your system the script `h1dd3n.sh` return this message.

```bash
[-] Need install tor package (https://linux.die.net/man/1/tor).
```

 - If your try execute `h1dd3n.sh` script without any argument the script return this message.

```bash
[-] Exec: h1dd3n.sh <your_localhost_service_port>
```

After run, you have a URL sharing your service throug onion network.

<p align="center">
 <img alt="Execution." src="https://i.imgur.com/BH9oDk5.png" title="Execution." width="115%">
</p>

In this example above, the `localhost service` on port `80` can be accessed by the onion address **vxhcmejdxruwdcfsusrjncfdiel7mkjaryfoluwunymozsa2xftfpeyd.onion** on port `80`.


***

**Enjoy!**
