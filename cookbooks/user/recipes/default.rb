user "deploy" do
  supports :manage_home => true
  home "/deploy/"
  shell "/bin/bash"
  gid "www-data"
end
