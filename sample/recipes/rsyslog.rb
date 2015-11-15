bash "change system setting" do
  user "root"
  code <<-EOH
echo "*.* @@10.159.138.174:514" >> /etc/rsyslog.conf
/bin/systemctl restart rsyslog 1>/dev/null 2>&1  
EOH
end
