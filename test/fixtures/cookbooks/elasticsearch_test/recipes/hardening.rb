
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
end

service "elasticsearch" do
  action :restart
end
