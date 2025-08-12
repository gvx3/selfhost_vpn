output "instance_public_ip" {
  value = oci_core_public_ip.public_ip.ip_address
}

output "instance_private_key" {
  value     = tls_private_key.ssh.private_key_openssh
  sensitive = true
}
