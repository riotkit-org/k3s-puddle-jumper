k3s-puddle-jumper
=================

A Space Harbor deployment template pre-configured for a minimal K3s cluster deployment.

Requirements
------------

- OS: Ubuntu 22.04 LTS (recommended)
- Virtualization: KVM/VMWare/Xen
- Memory: 4GB+ (1GB reserved for infrastructure - k3s, ingress controller, cert-manager, etc.)
- CPU: 1-2vCPU (recommended at least 2 vCPU)

Getting started
---------------

1. Prepare an Admin VPN setup
   Admin VPN is a WireGuard VPN - bulletproof and ultra lightweight entrypoint to your K3s node network from your computer.

   At the beginning you need to generate a private & public keypair on your local computer.

   ```bash
   # private key
   wg genkey > privkey
   # public key
   cat privkey | wg pubkey > pubkey
   ```
   
   Then in your `vars` (inventory) e.g. `hosts.yaml` put your public key and IP address:

   ```yaml
   cluster:
     hosts:
        # (...)
        primary-01:
            # (...)
            admin_vpn_ip: 10.257.0.1   # your internal node IP
            admin_vpn_peers:
             - ip: 10.157.0.2          # your laptop IP
               public_key: "MY-PUBKEY-HERE"
   ```

2. Run provisioning

   todo


Origin of the name
------------------

Inspired by Stargate series `Puddle Jumper` spaceship, which is a small, flexible and fast ship that can fly through the Stargates.

