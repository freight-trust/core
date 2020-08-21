vi /etc/systemd/system/disable-transparent-huge-pages.service
    [Unit]
    Description=disable-transparent-huge-pages

    [Service]
    Type=oneshot
    ExecStart=/bin/sh -c "echo "never" | tee /sys/kernel/mm/transparent_hugepage/enabled"
    ExecStart=/bin/sh -c "echo "never" | tee /sys/kernel/mm/transparent_hugepage/defrag"

    [Install]
    WantedBy=multi-user.target

systemctl enable disable-transparent-huge-pages.service
systemctl start disable-transparent-huge-pages.service
