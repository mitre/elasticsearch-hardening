
cookbook_file '/etc/elasticsearch/x-pack/instances.yml' do
  source 'instances.yml'
  owner 'root'
  group 'root'
  mode '0664'
action :create
end

execute 'generate_certs' do
  command './usr/share/elasticsearch/bin/x-pack/certgen --in instances.yml --out elastic.zip -s'
  cwd '/'
  ignore_failure true
end

zipfile '/etc/elasticsearch/x-pack/elastic.zip' do
  into '/etc/elasticsearch/x-pack/'
  ignore_failure true
end

service "elasticsearch" do
  action :restart
end

execute 'set auditd rule' do
  command 'auditctl -w /etc/elasticsearch/elasticsearch.yml -p war -k elasticsearch-config'
  cwd '/'
  ignore_failure true
end

directory '/var/log/elasticsearch/audit' do
  owner 'elasticsearch'
  group 'elasticsearch'
  mode '0644'
action :create
end

directory '/var/log/elasticsearch/' do
  owner 'elasticsearch'
  group 'elasticsearch'
  mode '0600'
end

directory '/usr/share/elasticsearch' do
  owner 'elasticsearch'
  group 'elasticsearch'
action :create
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    file.insert_line_if_no_match("^InputFileName /var/log/elasticsearch/elasticsearch_access.log.*$",
      "InputFileName /var/log/elasticsearch/elasticsearch_access.log")
    file.write_file
  end
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    file.insert_line_if_no_match("^*.* @@logagg.site.mil.*$", "*.* @@logagg.site.mil")
    file.write_file
  end
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/audit/auditd.conf")
    file.search_file_replace_line("^space_left = ", "space_left = 10740")
    file.write_file
  end
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/security/limits.conf")
    file.insert_line_if_no_match("^elasticsearch hard priority 1.*$", "elasticsearch hard priority 1")
    file.write_file
  end
end

yum_package ['aide', 'chrony', 'ntp'] do
  action :install
end

service 'chronyd' do
  action [ :enable, :start ]
end

service 'ntpd' do
  action [ :enable, :start ]
end
