# Prequisites 
## MacOs
1. Install Python3
```  bash
brew install python3
```
2. install ansible with homebrew 
``` bash
brew install ansible 
```
3. install sshpass 
``` bash
brew install sshpass
```
## Ubuntu 
TODO:

# How to use
## Tools 
check if can connect target server , production is the file where store the server infos list

``` bash
ansible all -i inventories/production -m ping -vvv
```


## Deploy
``` bash
ansible-playbook -i inventories/production site.yml -vvv
```