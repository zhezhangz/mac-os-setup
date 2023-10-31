# Setup macOS with Ansible

## Preparation For Remote Machine Setup

> This section only apples when you want to set up a remote macOS machine.

You can set up a remote macOS machine from the current working device, like
a laptop on the same desk,
or an [EC2 Mac instance](https://aws.amazon.com/ec2/instance-types/mac/).
To manage a remote machine,
you have to enable remote login via SSH from the target machine.

1. Go to **System Preference** => **General** => **Sharing**
2. In **Advanced** section, enable **Remote Login**

Then create a new host in the `inventory.yml` file
with the IP address and hostname,
and add it to the `target` group.

> You can also replace `inventory.yml` with your own inventory if needed.
> Please note the group name `target` in the inventory file matters.

The inventory file after changing could be like:

```yaml
# filename: inventory.yml
---
mbp_group:
  hosts:
    my_new_amazing_macbook_pro:
      ansible_host: 192.168.0.3
      ansible_user: elisa
      host_key_checking: false
target:
  children:
    mbp_group:
```

## Set Up The Machine

### Execute The Setup

1. Run the following command from the current folder to start the setup.

   ```shell
   ansible-playbook playbook.yml --ask-pass --ask-become-pass
   ```

2. It will promote for two passwords:
    - the user login via SSH password (if setting up remotely)
    - the user's sudo password

   Enter the password of the macOS user to continue.

3. For the first time setting up a new macOS machine,
   it might promote **on the target machine** with the following pop-up
   for installing [Xcode Command Line Tools](https://developer.apple.com/xcode/resources/).
   And the script will fail with an error message. No worries.
   Choose **Install** to continue.
   After the installation, you have to restart from the step 1.

   ![install-dev-tools.png](.readme/install-dev-tools.png)

4. Take a cup of tee and wait.
   The script will finish its work and quit itself.

## References

- https://gist.github.com/mrlesmithjr/f3c15fdd53020a71f55c2032b8be2eda
- https://mac.getutm.app/
