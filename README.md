# 👷 WARNING: WORK IN PROGRESS 👷 Clone the ДA&amp;K accounts to your Ubuntu box - and get paid!

Hi there, I'm Дід Alik. I have a hobby project called [Stellar Help Exchange](https://github.com/amissine/shex/blob/main/README.md#presentation "Stellar hX, work in progress"). Presently, it passes all the integration tests locally. In these tests, the project's website interacts with Stellar hX users - simulated locally - via [Stellar](https://stellar.org/) testnet.

Before I move the website to production and connect it to Stellar public network, I want to setup a cloud-based environment to simulate Stellar hX users globally. To join it, clone this repo to your Ubuntu 24.04 LTS server and set it up there. The **Дід Alik & the Kids** cloud-based organization welcomes you!

Your box can support QA `tester`s only (a `qahub`), `dev`s only (a `devhub`), or both (a `tophub`). During its setup, it connects to one of our `tophub`s to clone the accounts you requested from our `tophub` to your hub.

## How to set up a qahub

To create an account on your server, you have to be a sudoer. A sudoer does not have to enter a password to execute a `sudo` command. For example, on my box I have account `alik`. To make `alik` a sudoer, I run:

```
echo "alik  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/alik
```

Please make sure you are a sudoer, then run:

```
cd $HOME
#git clone git@github.com:didalik/dak.org.hub.git    # read and write
git clone https://github.com/didalik/dak.org.hub.git # read only
cd dak.org.hub
bin/setup qahub # OR devhub <access-token> OR tophub <access-token>
```

This creates the `qa` and `tester` accounts on your hub. These are regular accounts, unable to run `sudo`. This also creates another, temporary, regular account called `relay`. This account effectively passes your IP address to our `tophub` and gets deleted right after.

As soon as our `tophub` gets your IP address, it connects to `qa` account on your box and completes the setup. The whole thing takes less than a minute to complete.

You are now hosting yet another `qahub` for us. Get paid!

## How to get paid

I shall pay you **HEXA 1000** for hosting a QA hub for us. It doesn't have to be up 24/7, but when it is, I shall pay you **HEXA 100** each time a tester uses your hub to interact with the project's website.

### Getting paid for setting up a QA hub

### Getting paid for QA hub usage

## How to set up a tophub

Add the following line

```
192.168.0.199   u22     # alik
```

to your `/etc/hosts` file. It holds the IP address of our authorization server. We use [OAuth](https://www.ionos.com/digitalguide/server/security/oauth/) to give you a [JWT](https://www.ionos.com/digitalguide/websites/web-development/json-web-token-jwt/) access token. Run

```
echo "export AUTH_ACCOUNT='alik@u22' # authorization server account" > $HOME/.ssh/.$HOSTNAME.env
cd $HOME/dak.org.hub # your clone of this repo
bin/sendauth request tophub | bin/sendauth approval | bin/setup tophub
```

to:

- request approval for the `tophub` support; and
- get and use your access token to setup the `index` account on your box.

Your box is a `tophub` now - it can clone `qahub`s, `devhub`s and `tophub`s. Onboarding paradize!

The following sequence diagram has more:

```
+---------+                         +--------------------------------------------------+
| you@hub |                         | https://kot.didalik.workers.dev/sendauth/request |
+---------+                         +--------------------------------------------------+
     | TODO    request tophub - returns approval JWT        |
     |----------------------------------------------------->|
     | FOR NOW request tophub - returns approval JWT            +----------------------+
     |--------------------------------------------------------->| authorization server |
     |                                                          +----------------------+
     | send approval JWT - returns access JWT for index@tophub              |
     |--------------------------------------------------------------------->|
                                                                            |
+-----------+                              +--------------+                 |
| relay@hub |                              |  chr@tophub  |                 |
+-----------+                              +--------------+                 |
     |setup tophub using access JWT                |                        |
     |-------------------------------------------->|                        |
                                                                            |
+-----------+                              +--------------+                 |
| index@hub |                              | index@tophub |                 |
+-----------+                              +--------------+                 |
     |                                             | verify access JWT      |
     |                                             |----------------------->|
     |                              complete setup |
     |<--------------------------------------------|
```

## Contributors

```
# Дід Alik, didalik.aim@gmail.com, SSH public key:
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIQ3rb93nHY8SPz9K+sD7o6+KvBjzmxveraFMFbL5Ztg alik@th0host
```
