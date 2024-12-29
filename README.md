# 👷 WARNING: WORK IN PROGRESS 👷 Clone the ДA&amp;K accounts to your Ubuntu box - and get paid!

Hi there, I'm Дід Alik. I have a hobby project called [Stellar Help Exchange](https://github.com/amissine/shex/blob/main/README.md#presentation "Stellar hX, work in progress"). Presently, it passes all the integration tests locally. In these tests, the project's website interacts with Stellar hX users - simulated locally - via [Stellar](https://stellar.org/) testnet.

Before I move the website to production and connect it to Stellar public network, I want to setup a cloud-based environment to simulate Stellar HEX users globally. To join it, clone this repo to your Ubuntu 24.04 LTS server and set it up there. The **Дід Alik & the Kids** cloud-based organization welcomes you!

Your server can support QA `tester`s only (a `qahub`), `developer`s only (a `devhub`), or both (a `tophub`). During its setup, it connects to an existing top hub to clone the accounts you requested from our top hub to your hub.

## How to set up a hub

To create an account on your server, you have to be a sudoer. A sudoer does not have to enter a password to execute a `sudo` command. For example, on my box I have account `alik`. To make `alik` a sudoer, I run:

```
echo "alik  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/alik
```

Please make sure you are a sudoer, then run:

```
#git clone git@github.com:didalik/dak.org.hub.git    # read and write
git clone https://github.com/didalik/dak.org.hub.git # read only
cd dak.org.hub
bin/setup qahub # OR devhub <access-token> OR tophub <access-token>
```

This creates the `qahub` and `tester` accounts on your hub. These are regular accounts, unable to run `sudo`. This also creates another, temporary, regular account called `relay`. This account effectively passes your IP address to one of our existing top hubs and gets deleted right after.

As soon as our top hub gets your IP address, it connects to `qahub` account on your box and completes the setup. The whole thing takes less than a minute to complete.

You are now hosting yet another QA hub for us. Get paid!

## How to get paid

I shall pay you **HEXA 1000** for hosting a QA hub for us. It doesn't have to be up 24/7, but when it is, I shall pay you **HEXA 100** each time a tester uses your hub to interact with the project's website.

### Getting paid for setting up a QA hub

### Getting paid for QA hub usage

## How to obtain an [access token](https://www.ionos.com/digitalguide/server/security/oauth/ "TODO implement")

Start with running `bin/install-node` and `npm install`. Then run

```
bin/keys.mjs > $HOME/.ssh/hub.keys
bin/sendauth request tophub | bin/sendauth approval | bin/sendauth access > $HOME/.ssh/hub.jwt
```

to:

- create and save the secret and public keys for your hub;
- request approval for the `tophub` support; and
- get and save your access token to use with

```
bin/setup tophub < $HOME/.ssh/hub.jwt
```

The following sequence diagram has more:

```
+---------+                          +-------------------------------------------------+
| you@hub |                          | https://hx.didalik.workers.dev/sendauth/request |
+---------+                          +-------------------------------------------------+
     | request tophub, returns approval JWT                   |
     |------------------------------------------------------->|
     |                                                          +----------------------+
     |                                                          | authorization server |
     |                                                          +----------------------+
     | approval JWT, returns access JWT for tophub@tophub                   |
     |--------------------------------------------------------------------->|
     |                                      +---------------+               |
     |                                      | tophub@tophub |               |
     |                                      +---------------+               |
     | access JWT                                  |                        |
     |-------------------------------------------->| verify JWT             |
                                                   |----------------------->|
+------------+      +-----------+                  |
| tophub@hub |      | relay@hub |                  |
+------------+      +-----------+                  |
       |                  |                  relay |
       |            relay |<-----------------------|
       |<-----------------|                        |
       |                  |                        |
       | setup            |                        |
       |------------------------------------------>|
```
