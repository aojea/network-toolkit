# network-toolkit

Network Problem Diagnosis Tools and Recipes

## Tools

* netperf: <https://hewlettpackard.github.io/netperf/doc/netperf.html#Top>
* socat: <https://linux.die.net/man/1/socat>
* pwru: <https://github.com/cilium/pwru>
* bpftrace: <https://github.com/bpftrace/bpftrace>

## Container images

* agnhost

kubectl run webapp --image=registry.k8s.io/e2e-test-images/agnhost:2.47 -- /agnhost netexec --http-port=8080

* apache benchmark and server

kubectl run web --image=httpd:2

* network-toolkit: socat, bpftrace, pwru

kubectl run net-toolkit1 --image=aojea/network-toolkit:1 --privileged --overrides='{"apiVersion": "apps/v1", "spec": {"nodeSelector": { "kubernetes.io/hostname": "kind-worker" }}}'

## Debug/Ephemeral containers

<https://github.com/kubernetes/kubernetes/issues/47862>

## References

* <https://anatomic.rip/netfilter_nf_tables/>
* <https://thermalcircle.de/doku.php?id=blog:linux:nftables_packet_flow_netfilter_hooks_detail>
* <https://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO-4.html>
* <https://developers.redhat.com/blog/2017/04/11/benchmarking-nftables>
* <https://developers.redhat.com/blog/2020/04/27/optimizing-iptables-nft-large-ruleset-performance-in-user-space>
* <https://www.joyfulbikeshedding.com/blog/2019-01-31-full-system-dynamic-tracing-on-linux-using-ebpf-and-bpftrace.html>
* <https://github.com/bpftrace/user-tools>
* <https://www.vicarius.io/vsociety/posts/cve-2022-1015-nftables-out-of-bounds-access-lpe>
* <https://thermalcircle.de/doku.php?id=blog:linux:connection_tracking_1_modules_and_hooks>
* <https://blog.tohojo.dk/2023/04/netfilter-packet-drop-attribution-using-bpf.html>
* <https://debugging.works/posts/how-to-bpftrace/>
