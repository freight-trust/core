sleep 1

cat << EOF > /etc/systemd/system/set-txqueuelen.service
    [Unit]
    Description=set-txqueuelen

    [Service]
    Type=oneshot
    ExecStart=/sbin/ifconfig [INTERFACE] txqueuelen 5000

    [Install]
    WantedBy=multi-user.target
EOF

systemctl enable set-txqueuelen.service
systemctl start set-txqueuelen.service
