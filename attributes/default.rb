default['r']['install_dir'] = "/opt"
default['r']['version'] = "3.1.1"
default['r']['download_dir'] = "/root/source"
default['r']['download_url'] = "http://cran.cnr.berkeley.edu/src/base/R-3/R-#{node['r']['version']}.tar.gz"

# Packages
case node['platform_family']
when 'rhel'
  default['r']['packages'] = %w[wget gcc-gfortran readline readline-devel]
end

# Path in Environment Modules
default['r']['modulefiles_dir'] = "/opt/modules-3.2.10/Modules/3.2.10/modulefiles"
default['r']['modulefile_default_version'] = node['r']['version']
