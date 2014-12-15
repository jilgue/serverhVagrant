# Because it's required
source "https://supermarket.getchef.com"

metadata

cookbooks = %w[
  cpz-apache
]

local_file_flag = "local.flag"

if File.exist?(local_file_flag) then
  # Get first line that isn't a comment
  path = File.read(local_file_flag).split("\n").select { |l| l[0] != "#" }

  path = "#{ENV['HOME']}/#{path}"
  if not File.exist?(path) then
    path = "#{ENV['HOME']}/vagrant/cookbooks"
  end

  if not File.exist?(path) then
    puts "ERROR: Cannot find local repositories."
    exit 0
  end

  cookbooks.each { |c|
    cookbook c, '', path: "#{path}/#{c}"
  }

else
  # No local copy, go to repository for them
  cookbooks.each { |c|
    cookbook c, '', git: "ssh://bbdev02/var/spool/git/cookbooks/#{c}"
  }
end
