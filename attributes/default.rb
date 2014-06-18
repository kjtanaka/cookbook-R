default['r']['install_dir'] = "/opt"
default['r']['version'] = "3.1.0"
default['r']['download_dir'] = "/root/source"
default['r']['download_url'] = "http://cran.cnr.berkeley.edu/src/base/R-3/R-#{node['r']['version']}.tar.gz"

# Packages
case node['platform_family']
when 'rhel'
  default['r']['packages'] = %w[wget gcc-gfortran readline readline-devel]
end

# Path in Environment Modules
default['r']['modulefile_dir'] = "/opt/Modules/3.2.8/modulefiles/applications/R/"
