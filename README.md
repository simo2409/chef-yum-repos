yum_repos Cookbook
==================
This cookbook installs EPEL and Remi repos into CentOs 7.

Requirements
------------
CentOS 7

Attributes
----------
None

Usage
-----
#### yum_repos::default
Just include `yum_repos` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[yum_repos]"
  ]
}
```

Contributing
------------
Need help for testing following best practises, if you can help you are welcome!

License and Authors
-------------------
Authors:
Simone Dall'Angelo
