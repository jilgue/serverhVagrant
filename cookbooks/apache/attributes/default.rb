# enable mod rewrite
execute "/usr/sbin/a2enmod rewrite" do
  notifies :restart, "service[apache2]"
  not_if do (::File.symlink?("/etc/apache2/mods-enabled/rewrite.load") and
             ((::File.exists?("/etc/apache2/mods-available/rewrite.conf"))?
                (::File.symlink?("/etc/apache2/mods-enabled/rewrite.conf")):(true)))
  end
end
