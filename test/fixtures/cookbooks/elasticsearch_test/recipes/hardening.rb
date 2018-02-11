
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

directory '/usr/share/elasticsearch' do
  owner 'elasticsearch'
  group 'elasticsearch'
action :create
end