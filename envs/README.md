
## Precondition

Have `Ansible` and `LXD` installed

Keep the `community.general` collection up to date, otherwise container creation can fail with a `"Not Found"` error (older versions POST to the deprecated `/1.0/containers` API endpoint):

```
ansible-galaxy collection install community.general --upgrade
```

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
