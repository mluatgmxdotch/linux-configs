
## Precondition

Have `Ansible` and `LXD` installed

## How to use a Development Container

```
lxc start jakarta
./lxc-login jakarta
```

## Re-provision a Developent Container e.g. with new Roles

```
./lxc-ansible jakarta
```

## Create a new Container

```
ansible-playbook playbook.yml
```
