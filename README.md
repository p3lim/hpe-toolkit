# HPE Toolkit

This repository contains a container image and script for maintaining HPE servers,
specifically the ProLiant Gen10 series.

The container image contains:

- `ssacli` (HP's storage controller management tool)
- `hponcfg` (HP's remote iLO configuration tool)
- `smartupdate` (HP's firmware staging tool)
- [DNF repository for firmware packages](https://downloads.linux.hpe.com/sdr/project/fwpp/)
	- requires `FWPP_TOKEN` environment variable to be set
- script to iterate through the host's inventory and perform firmware upgrade staging

## Usage

```bash
# upgrade firmware
kubectl run hpe-toolkit --rm -it --privileged --image ghcr.io/p3lim/hpe-toolkit \
                        --env FWPP_TOKEN=myfwpptoken
                        --overrides='{"spec":{"nodeSelector":{"kubernetes.io/hostname":"my-hpe-node"}}}'
                        upgrade


# disk/raid management
kubectl run hpe-toolkit --rm -it --privileged --image ghcr.io/p3lim/hpe-toolkit \
                       --overrides='{"spec":{"nodeSelector":{"kubernetes.io/hostname":"my-hpe-node"}}}'
If you don't see a command prompt, try pressing enter.

=> ctrl all show config
```
