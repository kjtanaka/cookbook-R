R Cookbook
==========
This cookbook installs R from source.

Requirements
------------

#### cookbook

* build-essential

#### platform

* CentOS 6.5 is supported and tested.

Attributes
----------

#### R::default

| Key | Type | Description | Default |
| :--------- | :-- | :--------- | :------ |
|<tt>['r']['version']</tt> | Text | Version | <tt>3.1.0</tt> |
|<tt>['r']['download_dir']</tt> | Text | Download Directory | <tt>/root/source</tt> |
|<tt>['r']['download_url']</tt> | Text | Download URL | <tt>http://cran.cnr.berkeley.edu/src/base/R-3/R-#{node['r']['version']}.tar.gz</tt> |
|<tt>['r']['install_dir']</tt> | Text | Install Directory | <tt>/opt</tt> |
|<tt>['r']['packages']</tt> | Text | Required Packages | <tt>%w[wget gcc-gfortran readline readline-devel]</tt> |

Usage
-----
#### R::default

Just include `R` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[R]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Koji Tanaka (<kj.tanaka@gmail.com>)

```text
Copyright:: 2014 FutureGrid Project, Indiana University

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
