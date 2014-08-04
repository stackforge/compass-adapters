name "os-network"
description "Configures OpenStack networking, managed by attribute for either nova-network or quantum"
override_attributes(
  "rsyslog" => {
    "loglist" => {
      "quantum-ovsagent" => "/var/log/quantum/openvswitch-agent.log",
      "quantum-dhcp" => "/var/log/quantum/dhcp-agent.log",
      "quantum-l3agent" => "/var/log/quantum/l3-agent.log"
    }
  }
)
run_list(
  "role[os-base]",
  "recipe[openstack-network::openvswitch]",
  "recipe[openstack-network::l3_agent]",
  "recipe[openstack-network::dhcp_agent]",
  "recipe[openstack-network::metadata_agent]"
  )
