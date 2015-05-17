CLOUD_CONFIG = "/var/lib/coreos-install/user_data"

execute "mkdir -p /opt/bin" do
  user "root"
  command "mkdir -p /opt/bin"
  not_if "ls /opt/bin"
end

template "/opt/bin/diff" do
  owner "root"
  group "root"
  mode "755"
  source "diff"
end

template CLOUD_CONFIG do
  source "./user_data.yml.erb"
end

execute "validate cloud-config" do
  user "root"
  command "coreos-cloudinit -validate='true' -from-file=#{CLOUD_CONFIG}"
end

execute "apply cloud-config to fs" do
  user "root"
  command "coreos-cloudinit -from-file=#{CLOUD_CONFIG}"
end
