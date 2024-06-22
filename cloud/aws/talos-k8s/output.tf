


output "vpc" {
  value = local.vpc_id
}
output "lb" {
  value = aws_lb.lb.dns_name
}
output "control-plane" {
  # value = aws_instance.control-plane.*.private_ip
  value = values(aws_instance.control-plane).*.private_ip
}
output "workers" {
  value = values(aws_instance.worker).*.private_ip
}

output "bastion" {
  value = var.use-bastion ? aws_instance.bastion[0].public_ip : ""
}


output "info" {
  value = <<EOF

## Bootstrap
%{~ if var.use-bastion ~}

## Bastion (Check only)
ssh -i ${path.root}/private/sshkey  -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" ubuntu@${aws_instance.bastion[0].public_ip}

### Check cloud init status
ssh -i ${path.root}/private/sshkey  -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" ubuntu@${aws_instance.bastion[0].public_ip} sudo tail -f /var/log/cloud-init-output.log

%{~ else ~}

## Without Bastion

talosctl config endpoint ${aws_lb.lb.dns_name}
talosctl config node ${aws_lb.lb.dns_name}
talosctl bootstrap
talosctl kubeconfig --merge
talosctl health
%{~ endif ~}


EOF
}

output "yb-setup" {
  value = <<EOF
## Setup local kubectl env
talosctl config endpoint ${aws_lb.lb.dns_name}
talosctl config node ${aws_lb.lb.dns_name}
talosctl kubeconfig --merge
kubectl get nodes
talosctl dashboard

kubectl create ns yb-demo
helm upgrade \
  yb-demo \
  yugabytedb/yugabyte \
  --install \
  --version 2.21.0 \
  -n yb-demo \
  --set storage.ephemeral=true \
  --set resource.master.requests.cpu=0.5 \
  --set resource.master.requests.memory=0.5Gi \
  --set resource.tserver.requests.cpu=0.5 \
  --set resource.tserver.requests.memory=0.5Gi \
  --set yugabytedUi.enabled=true \
  --set enableLoadBalancer=false

  kubectl wait --for=condition=Ready pods  -l app=yb-tserver --namespace yb-demo

  kubectl exec -it -n yb-demo yb-tserver-0 -c yb-tserver -- ysqlsh -h yb-tserver-0 -c 'select version();'
EOF
}
