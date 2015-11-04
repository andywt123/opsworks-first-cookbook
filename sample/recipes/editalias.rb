bash "change system greeting" do
  user "root"
  code <<-EOF
#!/bin/bash -x
# Set root email alias to cloudops@nuvitek.com, according to RHEL-06-000521
echo -e "Setup root email alias \n"

grep -q "^root:\+[[:space:]]\+cloudops@nuvitek.com$" /etc/aliases
if [ $? -ne 0 ]; then
   grep -q ^root: /etc/aliases
   if [ $? -ne 0 ]; then
      echo "root:           cloudops@nuvitek.com" >> /etc/aliases
   else
      sed -i "s/^root:.*/root:           Icloudops@nuvitek.com/" /etc/aliases
   fi
fi
/usr/bin/newaliases 1>/dev/null 2>&1
EOH
end
