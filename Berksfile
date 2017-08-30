source 'https://supermarket.chef.io'

metadata

group :integration do
  cookbook 'elasticsearch_test', path: './test/fixtures/cookbooks/elasticsearch_test'

  # not a strict dependency, but necessary for TK testing
  cookbook 'java'
  cookbook 'curl'
  cookbook 'apt'
  cookbook 'yum'
  cookbook 'windows'
  cookbook 'ark'
  cookbook 'build-essential'
  cookbook 'homebrew'
  cookbook 'zipfile'


end
